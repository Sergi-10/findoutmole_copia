import firebase_admin
from firebase_admin import credentials
import os
import json

cred_data = json.loads(os.environ["FIREBASE_CREDENTIALS"]) #Para otros casos, lo unico que se cambia es REBASE_CREDENTIALS que la variable de entorno que se crea para que la pueda leer Render
cred = credentials.Certificate(cred_data)
firebase_admin.initialize_app(cred)
