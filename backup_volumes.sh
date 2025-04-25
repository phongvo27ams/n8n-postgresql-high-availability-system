#!/bin/bash
set -e

timestamp=$(date +"%Y%m%d_%H%M%S")
backup_dir="./docker_backups/$timestamp"
mkdir -p "$backup_dir"

echo "Backing up Docker volumes..."

for volume in n8n_postgres_data n8n_n8n_data n8n_prometheus_data; do
  echo "Backing up $volume..."
  docker run --rm \
    -v ${volume}:/volume \
    -v "$backup_dir":/backup \
    alpine sh -c "cd /volume && tar czf /backup/${volume}.tar.gz ."
done

echo "Backup completed at $backup_dir"