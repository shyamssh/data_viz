
FROM python:3.8.9-buster

RUN pip install --no-cache-dir --upgrade pip setuptools

VOLUME ["/app"]
WORKDIR /app

COPY requirements.txt /

RUN pip install --no-cache-dir -r /requirements.txt

RUN jupyter nbextensions_configurator enable --user
