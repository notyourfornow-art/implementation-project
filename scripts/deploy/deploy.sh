#!/bin/bash
# Развёртывание версии $1
set -e
VERSION=$1
if [ -z "$VERSION" ]; then echo "Укажите версию: deploy.sh v1.2.0"; exit 1; fi

docker pull registry.example.edu/helpdesk:$VERSION
docker tag registry.example.edu/helpdesk:$VERSION helpdesk:current
docker compose up -d backend notifications
echo "Развёрнута версия $VERSION"
