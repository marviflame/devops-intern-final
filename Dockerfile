FROM python:3.11-slim

WORKDIR /app

COPY hello.py  /app/hello.py

EXPOSE 8000

CMD ["python", "hello.py"]