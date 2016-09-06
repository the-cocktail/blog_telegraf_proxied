#!/bin/bash
docker run --rm -ti -p 8086:8086 -p 8083:8083 --name influx influxdb
