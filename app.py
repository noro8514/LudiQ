import os
from dotenv import load_dotenv
from flask import Flask, request, abort, render_template
from flask_cors import CORS

import sentry_sdk

load_dotenv()

app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return "Test Route"

@app.route('/analyze_circuit', methods=['POST'])
def analyze_circuit():
    if not request.is_json:
        abort(400, description="Request must be JSON")
    
    data = request.get_json()
    # Here you would process the data and analyze the circuit
    # For now, we will just return the received data
    return {"received_data": data}, 200

if __name__ == '__main__':
    app.run()