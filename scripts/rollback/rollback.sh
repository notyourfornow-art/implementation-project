#!/bin/bash
# Возврат к версии $1
set -e
VERSION=$1
docker pull registry.example.edu/helpdesk:$VERSION
docker tag registry.example.edu/helpdesk:$VERSION helpdesk:current
docker compose up -d backend notifications
echo "Выполнен откат к $VERSION"
