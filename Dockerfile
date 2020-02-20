FROM python:3.6-slim

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends build-essential git-core openssl libssl-dev libffi6 libffi-dev curl  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

WORKDIR /app

RUN pip install aiohttp==3.6.2
RUN pip install Nuitka==0.6.7
COPY . .
RUN cd utils && python -m nuitka --module --python-flag=-OO --remove-output --lto network.py
RUN rm utils/network.py

ENTRYPOINT [ "python", "main.py" ]
