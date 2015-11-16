FROM ubuntu:14.04.3

MAINTAINER Christopher Riley "riguy724@gmail.com"

WORKDIR /setup

RUN apt-get update && \
      apt-get install -y tree supervisor vim wget curl nginx apache2-utils

COPY nginx-default /etc/nginx/sites-available/default

RUN groupadd -g 199 kibana && \
      useradd -u 199 -g 199 kibana

RUN curl https://download.elastic.co/kibana/kibana/kibana-4.2.0-linux-x64.tar.gz | tar xz && \
      mkdir -p /opt/kibana && \
      cp -R kibana-4*/* /opt/kibana && \
      rm -r kibana-4*

COPY kibana.yml /opt/kibana/config/kibana.yml

RUN chown -R kibana: /opt/kibana

RUN curl -o /etc/init.d/kibana \
      https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-init

RUN curl -o /etc/default/kibana \
      https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-default

RUN htpasswd -bc /etc/nginx/htpasswd.users kibanaadmin kibana
RUN chmod +x /etc/init.d/kibana && \
      update-rc.d kibana defaults 96 9

COPY supervisord.conf /etc/supervisord.conf

CMD supervisord -c /etc/supervisord.conf
