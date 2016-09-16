FROM ubuntu:16.04

MAINTAINER ben@iron.io

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y wget apt-utils apt-transport-https \
  && wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add - \
  && echo "deb     https://sensu.global.ssl.fastly.net/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get install -y sensu supervisor uchiwa

COPY files/config.json files/transport.json files/uchiwa.json /etc/sensu/
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 4567

CMD ["/usr/bin/supervisord"]
