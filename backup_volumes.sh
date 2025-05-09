#!/bin/bash
set -e

timestamp=$(date +"%Y%m%d_%H%M%S")
backup_dir="./docker_backups/$timestamp"
mkdir -p "$backup_dir"

echo "Backing up Docker volumes..."

for volume in n8n-postgresql-high-availability-system_n8n_data n8n-postgresql-high-availability-system_postgres_data n8n-postgresql-high-availability-system_prometheus_data n8n-postgresql-high-availability-system_grafana_data; do
  echo "Backing up $volume..."
  docker run --rm \
    -v ${volume}:/volume \
    -v "$backup_dir":/backup \
    alpine sh -c "cd /volume && tar czf /backup/${volume}.tar.gz ."
done

echo "Backup completed at $backup_dir"