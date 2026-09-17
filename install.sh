#!/usr/bin/env bash
# install.sh - create a new Laravel project and install Sail
# ----------------------------------------------------------
# Usage: install.sh <project_name> [options of laravel new]
#
# Example: install.sh my-project --react --phpunit --no-boost
#
IMAGE=haessal/laravel-installer:latest

if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name> [options of laravel new]"
    exit 1
fi
PROJECT_NAME=$1

echo "Creating Laravel project: ${PROJECT_NAME}"
docker run --rm -it \
  -v $(pwd):/opt -w /opt \
  ${IMAGE} \
  laravel new "$@"

cd ${PROJECT_NAME}

echo "Installing Sail..."
docker run --rm -it \
  -v $(pwd):/opt -w /opt \
  ${IMAGE} \
  php artisan sail:install --with=mysql,redis,meilisearch,mailpit,selenium

echo "The install successfully completed."
