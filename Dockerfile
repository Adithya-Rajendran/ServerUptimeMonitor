FROM python:3.11

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY wol-app.py ./
COPY healthcheck.sh ./

HEALTHCHECK --interval=30m --timeout=10s --retries=3 CMD /app/healthcheck.sh

ENTRYPOINT [ "/usr/local/bin/python3", "/app/wol-app.py" ]