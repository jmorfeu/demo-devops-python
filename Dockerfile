# Dockerfile
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8000

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN adduser --disabled-password --no-create-home appuser
USER appuser

EXPOSE $PORT

HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1

CMD ["gunicorn", "demo.wsgi:application", "--bind", "0.0.0.0:8000"]
