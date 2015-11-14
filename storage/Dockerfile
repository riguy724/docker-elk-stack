FROM base

# create dir to mount
RUN mkdir -p /elasticsearch
RUN mkdir -p /kibana

VOLUME /var/lib/docker/data/etc/elasticsearch:/elasticsearch/etc/elasticsearch
VOLUME /var/lib/docker/data/var/log/elasticsearch:/elasticsearch/var/log/elasticsearch
VOLUME /var/lib/docker/data/var/lib/elasticsearch:/elasticsearch/var/lib/elasticsearch
VOLUME /var/lib/docker/data/kibana:/kibana

CMD ["true"]
