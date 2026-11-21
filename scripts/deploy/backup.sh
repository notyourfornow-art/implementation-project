#!/bin/bash
# Backup БД перед deployment
set -e
TS=$(date +%Y%m%d_%H%M%S)
pg_dump -h db.internal -U helpdesk_app helpdesk | gzip > /backups/helpdesk_pre_v1.2.0_$TS.sql.gz
echo "Backup создан: /backups/helpdesk_pre_v1.2.0_$TS.sql.gz"
