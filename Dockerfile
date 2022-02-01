FROM alpine:3.10

ARG FPRIME_VERSION=3.0.0

# Install python3/pip
ENV PYTHONUNBUFFERED=1

RUN apk upgrade \
    && apk add --update --no-cache \
    cmake==3.14.5-r0 \
    clang \
    clang-dev \
    make \
    wget \
    gcc \
    g++ \
    git \
    libc-dev \
    build-base \
    musl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    unzip \
    bash \
    linux-headers \
    openjdk11 \
    python3-dev \
    && ln -sf python3 /usr/bin/python

RUN python3 -m ensurepip

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# Install fprime
RUN wget -q https://github.com/nasa/fprime/archive/refs/tags/v${FPRIME_VERSION}.zip -O fprime.zip \
    && unzip -qq fprime.zip -d /tmp \
    && rm -rf fprime.zip

WORKDIR /tmp/fprime-${FPRIME_VERSION}