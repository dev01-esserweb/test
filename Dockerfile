FROM python:3.9.6-slim-buster

ENV PYTHONUNBUFFERED 1 

# Copia el archivo start.sh
COPY ./start.sh /start.sh
RUN chmod +x start.sh

# Copia el archivo gunicorn_conf.py
COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

# Expose the port 5000 in which our application runs
EXPOSE 5000
# Make /app as a working directory in the container
WORKDIR /app
# Copy requirements from host, to docker container in /app 
COPY ./requirements.txt .
# Copy everything from ./src directory to /app in the container
COPY ./src /app/src
# Install the dependencies
RUN pip install -r requirements.txt
