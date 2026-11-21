#!/bin/bash
# Применение миграций
set -e
psql -h db.internal -U helpdesk_app -d helpdesk -f migrations/002_add_notifications.sql
echo "Миграция 002 применена"
