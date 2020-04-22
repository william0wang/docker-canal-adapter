FROM openjdk:8-jre-alpine3.9

RUN echo "Asia/Shanghai" > /etc/timezone

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update bash ca-certificates openssl curl

ENV SHELL /bin/bash

RUN mkdir -p /opt/canal/adapter
RUN curl -L  https://github.com/alibaba/canal/releases/download/canal-1.1.4/canal.adapter-1.1.4.tar.gz | tar xvf -C /opt/canal/adapter
# ADD canal.adapter-1.1.4 /opt/canal/adapter

WORKDIR /opt/canal/adapter

ADD run.sh /opt/canal/adapter/run.sh

ENTRYPOINT ["/opt/canal/adapter/run.sh"]
