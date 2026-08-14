FROM python:3.10-slim

WORKDIR /app

COPY hello.py /app/hello.py

EXPOSE 8000

CMD ["python", "/app/hello.py"]