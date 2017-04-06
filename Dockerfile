FROM java:7
MAINTAINER Akira Yumiyama "yumiyama.akira@gmail.com"

ENV EMBULK_VERSION 0.8.18
RUN curl -L https://bintray.com/artifact/download/embulk/maven/embulk-${EMBULK_VERSION}.jar -o /opt/embulk.jar

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/opt/embulk.jar"]
CMD ["--help"]
