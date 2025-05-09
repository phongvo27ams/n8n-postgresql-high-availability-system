#!/bin/bash
set -e

backup_dir="$1"
if [ -z "$backup_dir" ]; then
  echo "Usage: ./restore_volumes.sh ./docker_backups/<timestamp>"
  exit 1
fi

echo "Make sure all services are stopped before restoring!"
read -p "Press Enter to continue..."

for volume in n8n-postgresql-high-availability-system_n8n_data n8n-postgresql-high-availability-system_postgres_data n8n-postgresql-high-availability-system_prometheus_data n8n-postgresql-high-availability-system_grafana_data; do
  echo "Restoring $volume..."
  docker volume create $volume || true
  docker run --rm \
    -v ${volume}:/volume \
    -v "$backup_dir":/backup \
    alpine sh -c "rm -rf /volume/* && tar xzf /backup/${volume}.tar.gz -C /volume"
done

echo "Restore completed!"