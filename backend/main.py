from fastapi import FastAPI, File, UploadFile, HTTPException, Depends, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from PIL import Image
from io import BytesIO
from models.prediction import PredictionResponse
from services.ml_model import predict_image
from services.auth import verify_token, db
import uuid
from datetime import datetime
import logging
import os
from pathlib import Path
import json

# Configura el sistema de logs para ver errores y trazas en consola
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Crea la instancia principal de la aplicación FastAPI
app = FastAPI(title="FindOutMole API")

# Configura CORS para permitir solo orígenes específicos durante desarrollo
# Esto evita aceptar peticiones de dominios no autorizados
app.add_middleware(
    CORSMiddleware,
    allow_origins=[ #Lista de dominios permitidos. Solo estos pueden hacer peticiones al backend.Locales para pruebas
        "http://localhost:3000",
        "http://localhost:3001",
        "http://localhost:3002",
        "https://findoutmole-backend.onrender.com" #Se añade para permitir que el propio backend acceda a recursos estáticos o haga peticiones internas en Render.
    ],
    #Descomentar cuando la app tenga dominio definitio localhost:3000-3002 son puertos locales de pruebas
    #allow_origins=["https://tu-dominio-final.vercel.app"]

    allow_credentials=True, #Permite el uso de cookies y credenciales en las peticiones o certificados SSL entre el frontend y el backend. necesario si usas autenticación con tokens o cookies.
    allow_methods=["*"], #Acepta cualquier tipo de  HTTP: GET, POST, DELETE, etc.
    allow_headers=["*"], ## Acepta cualquier tipo de cabecera HTTP como Authorization, Content-Type, etc.

)

# Crea el directorio de subida de imágenes si no existe
UPLOAD_DIR = Path("uploads")
UPLOAD_DIR.mkdir(exist_ok=True)

# Permite acceder públicamente a las imágenes guardadas desde /uploads
app.mount("/uploads", StaticFiles(directory=UPLOAD_DIR), name="uploads")

# Ruta raíz para comprobar si el backend está activo
@app.get("/")
async def root():
    return {"message": "Welcome to FindOutMole API"}

# Ruta OPTIONS que permite precargar información del endpoint /predict (CORS preflight)
@app.options("/predict")
async def options_predict():
    return JSONResponse(status_code=200)

# Ruta POST que recibe una imagen, la analiza con el modelo, la guarda, y registra en Firestore
@app.post("/predict", response_model=PredictionResponse)
async def predict(request: Request, file: UploadFile = File(...), user: dict = Depends(verify_token)):
    logger.info(f"Recibida solicitud POST /predict para usuario: {user.get('uid')}")
    logger.info(f"Content-Type del archivo: {file.content_type}")

    # Validación del tipo de archivo
    if not file.content_type.startswith("image/"):
        logger.error("Archivo no es una imagen")
        raise HTTPException(status_code=400, detail="El archivo debe ser una imagen")

    try:
        # Lee el contenido del archivo
        contents = await file.read()
        if not contents:
            logger.error("El archivo está vacío")
            raise HTTPException(status_code=400, detail="Archivo vacío")

        # Carga la imagen en memoria
        image = Image.open(BytesIO(contents))
        logger.info("Imagen cargada correctamente")

        # Realiza la predicción con el modelo ML
        prediction, prediction_type, probabilities = predict_image(image)
        logger.info(f"Predicción completada: {prediction}")

        # Genera un ID único para este diagnóstico
        diagnostic_id = str(uuid.uuid4())
        user_id = user.get('uid')
        logger.info(f"Generado diagnostic_id: {diagnostic_id} para user_id: {user_id}")

        # Crea carpeta del usuario si no existe y guarda la imagen en el disco
        user_dir = UPLOAD_DIR / "diagnostics" / user_id
        user_dir.mkdir(parents=True, exist_ok=True)
        image_path = user_dir / f"{diagnostic_id}.jpg"
        with open(image_path, "wb") as f:
            f.write(contents)
        logger.info(f"Imagen guardada en: {image_path}")

        # Construye la URL accesible públicamente a la imagen
        base_url = str(request.base_url).rstrip("/")
        image_url = f"{base_url}/uploads/diagnostics/{user_id}/{diagnostic_id}.jpg"
        logger.info(f"URL de la imagen: {image_url}")

        # Guarda los datos del diagnóstico en Firestore
        diagnostic_data = {
            "prediction": prediction,
            "type": prediction_type,
            "probabilities": probabilities,
            "image_url": image_url,
            "timestamp": datetime.utcnow(),
            "diagnostic_id": diagnostic_id
        }

        db.collection("users").document(user_id).collection("diagnostics").document(diagnostic_id).set(diagnostic_data)
        logger.info("Diagnóstico guardado en Firestore")

        # Devuelve la respuesta al cliente
        return PredictionResponse(
            prediction=prediction,
            type=prediction_type,
            probabilities=probabilities
        )

    except Exception as e:
        # Captura cualquier error inesperado sin filtrar el mensaje completo al cliente
        logger.error(f"Error procesando la solicitud", exc_info=True)
        raise HTTPException(status_code=500, detail="Error interno procesando la imagen")

# Ruta GET para consultar los diagnósticos de un usuario autenticado
@app.get("/diagnostics")
async def get_diagnostics(user: dict = Depends(verify_token)):
    logger.info(f"Recibida solicitud GET /diagnostics para usuario: {user.get('uid')}")
    try:
        user_id = user.get('uid')
        docs = db.collection("users").document(user_id).collection("diagnostics").stream()
        diagnostics = [{**doc.to_dict(), "diagnostic_id": doc.id} for doc in docs]
        logger.info(f"Devolviendo {len(diagnostics)} diagnósticos")
        return {"diagnostics": diagnostics}
    except Exception as e:
        logger.error("Error obteniendo diagnósticos", exc_info=True)
        raise HTTPException(status_code=500, detail="Error interno obteniendo diagnósticos")

# Ruta DELETE para eliminar un diagnóstico y su imagen asociada
@app.delete("/diagnostics/{diagnostic_id}")
async def delete_diagnostic(diagnostic_id: str, user: dict = Depends(verify_token)):
    logger.info(f"Recibida solicitud DELETE /diagnostics/{diagnostic_id} para usuario: {user.get('uid')}")
    try:
        user_id = user.get('uid')
        doc_ref = db.collection("users").document(user_id).collection("diagnostics").document(diagnostic_id)
        doc = doc_ref.get()

        # Verifica que el diagnóstico exista
        if not doc.exists:
            logger.error(f"Diagnóstico {diagnostic_id} no encontrado")
            raise HTTPException(status_code=404, detail="Diagnóstico no encontrado")

        # Elimina la imagen del sistema de archivos si existe
        image_path = UPLOAD_DIR / "diagnostics" / user_id / f"{diagnostic_id}.jpg"
        if image_path.exists():
            image_path.unlink()
            logger.info(f"Imagen eliminada: {image_path}")
        else:
            logger.warning(f"Imagen no encontrada: {image_path}")

        # Elimina el documento en Firestore
        doc_ref.delete()
        logger.info(f"Diagnóstico {diagnostic_id} eliminado de Firestore")

        return {"message": "Diagnóstico eliminado correctamente"}

    except Exception as e:
        logger.error("Error eliminando diagnóstico", exc_info=True)
        raise HTTPException(status_code=500, detail="Error interno eliminando diagnóstico")
