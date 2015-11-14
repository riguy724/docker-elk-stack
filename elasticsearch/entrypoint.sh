#!/bin/bash

mkdir -p /etc/elasticsearch
mkdir -p /var/lib/elasticsearch
mkdir -p /var/log/elasticsearch

cp -r /data/etc/* /etc/elasticsearch
cp -r /data/lib/* /var/lib/elasticsearch
cp -r /data/log/* /var/log/elasticsearch

supervisord -c /etc/supervisord.conf
