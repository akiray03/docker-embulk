FROM java:7
MAINTAINER Akira Yumiyama "yumiyama.akira@gmail.com"

ENV EMBULK_VERSION 0.8.18
RUN curl -L https://bintray.com/artifact/download/embulk/maven/embulk-${EMBULK_VERSION}.jar -o /opt/embulk.jar

RUN apt-get update && \
    apt-get install apt-transport-https -y && \
    rm -rf /var/lib/apt/lsits/*

ENV CLOUD_SDK_REPO cloud-sdk-jessie
RUN echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && \
    apt-get install -y \
      google-cloud-sdk \
      awscli \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 user
USER user
WORKDIR /home/user
