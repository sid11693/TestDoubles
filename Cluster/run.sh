#!/bin/sh

nohup consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -node=agent-one -bind=172.20.20.10 -config-dir /etc/consul.d &
nohup consul-template -config=haproxy.json &

while :; do
  sleep 300
done