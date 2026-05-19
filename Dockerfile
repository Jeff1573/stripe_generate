FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV HOST=0.0.0.0
ENV PORT=7790

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    -i https://mirrors.tencent.com/pypi/simple \
    --trusted-host mirrors.tencent.com \
    || pip install --no-cache-dir -r requirements.txt \
    -i https://pypi.org/simple

COPY server.py .

EXPOSE 7790

CMD ["python", "server.py"]
