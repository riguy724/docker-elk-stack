FROM ubuntu:14.04.3

MAINTAINER Christopher Riley "riguy724@gmail.com"

WORKDIR /src

RUN apt-get update && \
      apt-get install -y supervisor vim wget curl && \
      echo 'deb http://packages.elastic.co/logstashforwarder/debian stable main' | sudo tee /etc/apt/sources.list.d/logstashforwarder.list && \
      wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - && \
      apt-get update && \
      apt-get install logstash-forwarder

RUN mkdir -p /etc/pki/tls/certs

COPY logstash-forwarder.crt /etc/pki/tls/certs/logstash-forwarder.crt
COPY logstash-forwarder.conf /etc/logstash-forwarder.conf
COPY supervisord.conf /etc/supervisord.conf

CMD supervisord -c /etc/supervisord.conf
