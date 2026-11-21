#!/bin/bash
# Откат миграции 002 (обратимая)
set -e
psql -h db.internal -U helpdesk_app -d helpdesk <<'SQL'
DROP TABLE IF EXISTS notifications;
ALTER TABLE tickets DROP COLUMN IF EXISTS priority;
SQL
echo "Миграция 002 откачена"
