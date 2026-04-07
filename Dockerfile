FROM python:3.4-alpine
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]
