#!/bin/bash

export PWD="$(pwd)"


docker run -d \
  --name influxdb \
  -p 2003:2003 \
  -p 8086:8086 \
  -v $PWD/data:/var/lib/influxdb \
  -v $PWD/influxdb.conf:/etc/influxdb/influxdb.conf \
  --restart unless-stopped \
  influxdb
