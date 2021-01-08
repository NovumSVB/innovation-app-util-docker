#!/usr/bin/env bash
# system-create.sh
# Utility that utilises Inotify wait to trigger a "system create" event on demand.
#
# When a file is added to the data/queue/system directory this script will fire a php console command that creates a
# new system based on the properties inside the json file that fires the event. The json file is created after the user
# fills in a form via de webinterface that comes with this system.

DATA_DIR="/app/data"
QUEUE_DIR="$DATA_DIR/queue/system"
LOG_DIR="$DATA_DIR/log/system"
LOG_FILE="$LOG_DIR/create.log"

# Making sure the directories exist

echo "Create log directory $LOG_DIR"
mkdir -p "$LOG_DIR"

echo "Create queue directory $QUEUE_DIR"
mkdir -p "$QUEUE_DIR"

echo "Chmodding $DATA_DIR"
chmod 777 "$DATA_DIR" -R

# Wait for something to happen.
inotifywait -m "$QUEUE_DIR" -e create -e move |
while read path action file; do
  echo "New file in $QUEUE_DIR detected, start processing queue"
  /app/vendor/bin/novum.php queue:system:create
  echo "Queue processing finished"
done
