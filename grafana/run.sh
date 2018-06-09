#!/bin/bash

export PWD="$(pwd)"
export USER_ID=$(id -u)

mkdir -p ./lib/plugins

docker run -d \
  --name=grafana \
  -p 3000:3000 \
  --user $USER_ID \
  --restart unless-stopped \
  -v $PWD/data:/var/lib/grafana \
  grafana/grafana