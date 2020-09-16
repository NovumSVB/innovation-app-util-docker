#!/usr/bin/env bash

echo "Updating all depencencies"
# (cd /app; composer --verbose update --no-cache)



echo "Start apache webserver"
apachectl -D FOREGROUND