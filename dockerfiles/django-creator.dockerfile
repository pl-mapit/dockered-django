FROM python:3.12.6-alpine3.20

WORKDIR /app

COPY ./enviroment/requirements.txt .

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt


