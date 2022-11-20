FROM python:3.10

WORKDIR /run

COPY main.py .

RUN apt install gcc && \
    pip install watchdog && \
    mkdir -p /mnt/source && \
    mkdir -p /mnt/output

CMD [ "python", "main.py" ]
