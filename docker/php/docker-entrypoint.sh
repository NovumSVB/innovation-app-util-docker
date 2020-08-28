#!/bin/bash
set -e

if [ "$1" = 'install' ]; then
    echo "composer installling"
    exec composer install --no-interaction --ansi
fi

echo "Composer installation done"

