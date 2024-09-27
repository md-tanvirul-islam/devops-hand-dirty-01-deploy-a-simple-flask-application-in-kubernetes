FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir flask

EXPOSE 5000

ENV NAME Bangladesh

CMD ["python", "app.py"]