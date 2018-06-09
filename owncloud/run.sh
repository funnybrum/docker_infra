#!/bin/bash

../secrets.sh

export PWD="$(pwd)"

export OWNCLOUD_VERSION=10.0
export HTTPS_PORT=443

docker run -d \
  --name owncloud \
  --link mariadb:db \
  --link redis:redis \
  -p ${HTTPS_PORT}:443 \
  -e OWNCLOUD_DOMAIN=${DOMAIN} \
  -e OWNCLOUD_DB_TYPE=mysql \
  -e OWNCLOUD_DB_NAME=$OWNCLOUD_DATABASE \
  -e OWNCLOUD_DB_USERNAME=$MARIADB_USERNAME \
  -e OWNCLOUD_DB_PASSWORD=$MARIADB_PASSWORD \
  -e OWNCLOUD_DB_HOST=db \
  -e OWNCLOUD_ADMIN_USERNAME=${ADMIN_USERNAME} \
  -e OWNCLOUD_ADMIN_PASSWORD=${ADMIN_PASSWORD} \
  -e OWNCLOUD_REDIS_ENABLED=true \
  -e OWNCLOUD_REDIS_HOST=redis \
  --volume $PWD/data:/mnt/data \
  --restart unless-stopped \
  owncloud/server:${OWNCLOUD_VERSION}