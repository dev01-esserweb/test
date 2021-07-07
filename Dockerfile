FROM tiangolo/uvicorn-gunicorn:python3.8-slim

# Dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copia el archivo start.sh
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Copia el archivo gunicorn_conf.py
COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

# Expose the port 5000 in which our application runs
EXPOSE 80
# Make /app as a working directory in the container
WORKDIR /app
# Copy everything from ./src directory to /app in the container
COPY ./src /app/src

CMD ["/start.sh"]
