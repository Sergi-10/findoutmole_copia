from fastapi import HTTPException, Security, Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

# ⚠️ Este import debe estar antes que firestore.client()
from firebase_config import *
from firebase_admin import auth, firestore
import logging

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Ahora ya podemos usar firestore porque se inicializó antes
db = firestore.client()

security = HTTPBearer()

async def verify_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    try:
        token = credentials.credentials
        decoded_token = auth.verify_id_token(token)
        logger.info(f"Token verificado para usuario: {decoded_token.get('uid')}")
        return decoded_token
    except Exception as e:
        logger.error(f"Error verificando token: {str(e)}", exc_info=True)
        raise HTTPException(status_code=401, detail=f"Invalid token: {str(e)}")
