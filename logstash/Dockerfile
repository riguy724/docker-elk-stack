FROM ubuntu:14.04.3

MAINTAINER Christopher Riley "riguy724@gmail.com"

WORKDIR /setup

RUN apt-get update && \
      apt-get install -y tree vim wget curl software-properties-common python-software-properties && \
      echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
      add-apt-repository -y ppa:webupd8team/java && \
      wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - && \
      echo 'deb http://packages.elasticsearch.org/logstash/2.0/debian stable main' | tee /etc/apt/sources.list.d/logstash.list && \
      apt-get update && \
      apt-get -y install oracle-java8-installer logstash && \
      rm -rf /var/lib/apt/lists/* && \
      rm -rf /var/cache/oracle-jdk8-installer

COPY logstash-config/* /etc/logstash/conf.d/

CMD /opt/logstash/bin/logstash agent -f /etc/logstash/conf.d
