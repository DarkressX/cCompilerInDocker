FROM debian:bullseye-slim

WORKDIR /run

COPY main.py .

RUN apt update && apt install -y --no-install-recommends build-essential pip && \
    pip install watchdog && \
    mkdir -p /mnt/source && \
    mkdir -p /mnt/output && \
    rm -rf /var/lib/apt/lists/*

CMD [ "python3", "main.py" ]
