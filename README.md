# docker_infra

A set of scripts creating all of the required docker infra for my own home server. The included end-user services are:

* Owncloud
* Home Assistant
* Grafana


## Owncloud

Dependencies are:

* redis
* mariadb

To start a service from the scratch you'll have to create the accounts for the users. Files can't be transferred easily. The current straight forward (and slow) solution is to download them from the old storage and upload them to the new service.

## Grafana

Dependencies are:

* influxdb
* homeassistant (currently this is the only source of data for the influxdb)

