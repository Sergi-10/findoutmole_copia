from fastapi import HTTPException, Security, Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

# Importa la configuración de Firebase e inicializa la app antes de usar Firestore o Auth
# Esto es importante porque firebase_admin.initialize_app solo puede llamarse una vez
from firebase_config import *

from firebase_admin import auth, firestore
import logging

# Configura el sistema de logs para registrar eventos de autenticación y errores
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Inicializa el cliente de Firestore (ya es seguro usarlo después del import de firebase_config)
db = firestore.client()

# Define el esquema de autenticación para extraer el token Bearer del encabezado Authorization
security = HTTPBearer()

# Función para verificar la validez de un token JWT de Firebase
async def verify_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    try:
        token = credentials.credentials  # Extrae el token del encabezado Authorization
        decoded_token = auth.verify_id_token(token)  # Verifica el token con Firebase Admin
        logger.info(f"Token verificado para usuario: {decoded_token.get('uid')}")  # Registra el ID del usuario verificado
        return decoded_token  # Retorna el payload del token para usarlo en rutas protegidas
    except Exception as e:
        logger.error(f"Error verificando token: {str(e)}", exc_info=True)  # Registra el error con traza
        raise HTTPException(status_code=401, detail=f"Invalid token: {str(e)}")  # Devuelve error 401 al cliente
