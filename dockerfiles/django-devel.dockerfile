FROM python:3.12.6-alpine3.20

ARG APP_NAME

WORKDIR /${APP_NAME}

COPY ./enviroment/requirements.txt .

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]