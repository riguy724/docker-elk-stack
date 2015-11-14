FROM ubuntu:14.04.3

MAINTAINER Christopher Riley "riguy724@gmail.com"

WORKDIR /setup

RUN apt-get update && \
      apt-get install -y supervisor vim wget curl software-properties-common python-software-properties && \
      echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
      add-apt-repository -y ppa:webupd8team/java && \
      wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - && \
      echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list && \
      apt-get update && \
      apt-get -y install oracle-java8-installer elasticsearch && \
      rm -rf /var/lib/apt/lists/* && \
      rm -rf /var/cache/oracle-jdk8-installer

COPY supervisord.conf /etc/supervisord.conf
COPY etc/* /etc/elasticsearch/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
