#!/bin/bash
docker run --rm -ti -v $PWD/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro  -p 8186:8186 --name haproxy --link influx haproxy
