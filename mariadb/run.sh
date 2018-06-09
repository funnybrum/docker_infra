#!/bin/bash

../secrets.sh

export PWD="$(pwd)"

docker run -d \
  --name mariadb \
  -e MARIADB_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD \
  -e MARIADB_USERNAME=$OWNCLOUD_DATABASE_USERNAME \
  -e MARIADB_PASSWORD=$OWNCLOUD_DATABASE_PASSWORD \
  -e MARIADB_DATABASE=$OWNCLOUD_DATABASE \
  --volume $PWD/db:/var/lib/mysql \
  --volume $PWD/backup:/var/lib/backup \
  --restart unless-stopped \
  webhippie/mariadb:latest