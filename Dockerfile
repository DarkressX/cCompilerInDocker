FROM debian:bullseye-slim

WORKDIR /run

COPY main.py .

RUN apt update && apt install -y --no-install-recommends build-essential pip inetutils-ping && \
    pip install watchdog && \
    mkdir -p /mnt/source && \
    mkdir -p /mnt/output && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -M -g users user && \
    chown -R user /mnt

USER user
CMD [ "python3", "-u", "main.py" ]
