FROM python:3.10-slim-bullseye
ENV PYTHONUNBIFFERED=1
RUN apt update && apt upgrade -y && apt install -y build-essential pkg-config libhdf5-serial-dev libpq-dev

COPY requirements.txt /tmp
RUN pip3 install -r  /tmp/requirements.txt && rm /tmp/requirements.txt

WORKDIR /app
COPY app.py entrypoint.sh /app/

ENTRYPOINT ["sh", "/app/entrypoint.sh"]