FROM python:3.9.18-slim
WORKDIR /app
RUN sudo addgroup -S django\
    && sudo adduser -S django -G django\
    && sudo chown django:django /app
USER django
EXPOSE 8000
COPY . /app/
ENV POSTGRES=true\
    PYTHONDONTWRITEBYTECODE=1\
    PYTHONUNBUFFERED=1

RUN pip install -r requirements.txt
CMD python manage.py makemigrations && python manage.py migrage && python manage.py runserver 0.0.0.0:8000 
      