#!/bin/bash
set -e

export $(grep -v '^#' .env | xargs)

BACKUP_DIR="./backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +%F_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/devlogs-backup-$TIMESTAMP.sql"

echo "Backing up database to $BACKUP_FILE..."

docker compose -f docker-compose.yml -f docker-compose.prod.yml exec -T db \
  pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" > "$BACKUP_FILE"

echo "Backup complete: $BACKUP_FILE"

ls -1t "$BACKUP_DIR"/*.sql | tail -n +8 | xargs -r rm --