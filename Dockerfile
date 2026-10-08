FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p instance static/images

EXPOSE 7777

CMD ["gunicorn", "-c", "gunicorn_config.py", "wsgi:app"]
