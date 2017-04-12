FROM ubuntu:yakkety
MAINTAINER Akira Yumiyama "yumiyama.akira@gmail.com"

RUN apt-get update && \
    apt-get install apt-transport-https curl unzip zip -y && \
    rm -rf /var/lib/apt/lsits/*

ENV CLOUD_SDK_REPO cloud-sdk-yakkety
RUN echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && \
    apt-get install -y \
      google-cloud-sdk \
      awscli \
      gcc \
      python-dev \
      python-setuptools \
    && rm -rf /var/lib/apt/lists/*
RUN easy_install -U pip && \
    pip install -U crcmod

RUN useradd -m -u 1000 user
USER user
WORKDIR /home/user
