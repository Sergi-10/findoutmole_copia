import firebase_admin
from firebase_admin import credentials
import os
import json

# Evita inicializar Firebase más de una vez
if not firebase_admin._apps:
    try:
        if os.path.exists("firebase-adminsdk.json"):
            # Entorno local: lee desde el archivo físico
            cred = credentials.Certificate("firebase-adminsdk.json")
        else:
            # Entorno Render (producción): usa variable de entorno
            cred_data = json.loads(os.environ["FIREBASE_CREDENTIALS"])
            cred = credentials.Certificate(cred_data)

        firebase_admin.initialize_app(cred)

    except Exception as e:
        raise RuntimeError(f"No se pudo inicializar Firebase: {str(e)}")
