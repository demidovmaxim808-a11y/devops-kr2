FROM python:3.12-slim
WORKDIR /app
RUN useradd -m app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
RUN chown -R app:app /app
USER app
EXPOSE 8002
CMD ["flask", "run", "--host=0.0.0.0", "--port=8002"]