#!/bin/sh

echo "Starting API..."
flask --app app --debug run --host=0.0.0.0 --port=5051