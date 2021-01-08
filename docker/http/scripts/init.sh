#!/usr/bin/env bash

echo "Updating all depencencies"
# (cd /app; composer --verbose update --no-cache)


echo "Start inotify monitor"
LOG_DIR="/app/data/log/system/"
mkdir -p "$LOG_DIR"
/scripts/inotify/system-create.sh &

echo "Start apache webserver"
apachectl -D FOREGROUND