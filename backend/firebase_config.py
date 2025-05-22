import firebase_admin
from firebase_admin import credentials
import os
import json

# Evita inicializar Firebase más de una vez
if not firebase_admin._apps:
    try:
        # Carga las credenciales desde la variable de entorno
        cred_data = json.loads(os.environ["FIREBASE_CREDENTIALS"])
        # Crea el objeto de credenciales
        cred = credentials.Certificate(cred_data)
        # Inicializa Firebase
        firebase_admin.initialize_app(cred)
    except KeyError:
        # Error si la variable de entorno no está definida
        raise RuntimeError("La variable de entorno FIREBASE_CREDENTIALS no está definida")
    except Exception as e:
        # Captura otros errores de inicialización
        raise RuntimeError(f"No se pudo inicializar Firebase: {str(e)}")
