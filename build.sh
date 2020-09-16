#!/usr/bin/env bash
source ".env"

echo "Building $PROJECT_NAME"

echo "Shutting down all running containers"
docker-compose down
echo "Removing all containers"
docker rm -f $(docker ps -a -q)
echo "Removing all volumes"
docker volume rm $(docker volume ls -q)

if ! [[ -d ./data/log/mysql ]]; then
  mkdir -p  ./data/log/mysql
fi

if ! [[ -d ./data/db ]]; then
  mkdir -p  ./data/db
fi
echo "Removing existing files"
sudo rm -fr .system assets/ composer.lock data domain public vendor
echo "Rebuilding forced without cache"
sudo docker-compose build --force-rm --no-cache
# sudo docker-compose up -d --build

# docker exec "$PROJECT_NAME_http" chown -R root:www-data /usr/local/apache2/logs
# docker exec "$PROJECT_NAME_database"  chown -R root:www-data /usr/local/etc/logs
