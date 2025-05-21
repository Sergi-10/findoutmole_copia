import firebase_admin
from firebase_admin import credentials
import os
import json

cred_data = json.loads(os.environ["FIREBASE_CREDENTIALS"])
cred = credentials.Certificate(cred_data)
firebase_admin.initialize_app(cred)
