#!/bin/bash
# Восстановление БД из backup (крайняя мера)
set -e
BACKUP=$1
gunzip -c $BACKUP | psql -h db.internal -U helpdesk_app -d helpdesk
echo "БД восстановлена из $BACKUP"
