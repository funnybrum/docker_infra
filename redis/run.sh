#!/bin/bash

export PWD="$(pwd)"

docker run -d \
  --name redis \
  -e REDIS_DATABASES=1 \
  --volume $PWD/data:/var/lib/redis \
  --restart unless-stopped \
  webhippie/redis:latest