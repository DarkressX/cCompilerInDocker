FROM debian:bullseye-slim

WORKDIR /run

COPY main.py .

RUN apt update && apt install -y --no-install-recommends build-essential pip inetutils-ping
RUN pip install watchdog
RUN mkdir -p /mnt/source
RUN mkdir -p /mnt/output
RUN rm -rf /var/lib/apt/lists/*
RUN useradd -M -g users user
RUN chown -R user /mnt

USER user
CMD [ "python3", "-u", "main.py" ]
