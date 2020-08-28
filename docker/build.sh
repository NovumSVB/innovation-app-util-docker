#!/bin/bash
set -e

if ! [[ -d ../data/logs/apache ]]; then
    mkdir -p ../data/logs/apache
fi

if ! [[ -d ../data/logs/mysql ]]; then
    mkdir -p ../data/logs/mysql
fi

if ! [[ -d ../data/logs/php ]]; then
    mkdir -p ../data/logs/php
fi

if ! [[ -d ../data/mysql/db ]]; then
    mkdir ../mysql/db
fi

docker-compose up -d --build

docker exec helloworld_apache_con chown -R root:www-data /usr/local/apache2/logs
docker exec helloworld_php_con chown -R root:www-data /usr/local/etc/logs
