FROM python:3.9

WORKDIR /app/backend

COPY requirements.txt /app/backend
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt
RUN apt update && apt install -y nodejs npm
COPY . /app/backend
CMD ["node", "app.js"]
EXPOSE 8000
#RUN python manage.py migrate
#RUN python manage.py makemigrations
