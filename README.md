# Commands for Running and Testing an n8n HA System

1. Run the Docker compose with 3 n8n nodes

```
docker-compose up -d --scale n8n=3
```

2. List all running containers

```
docker ps
```

3. Stop and start a service

```
docker stop n8n-postgresql-high-availability-system-n8n-1
docker start n8n-postgresql-high-availability-system-n8n-1
```

4. Take a Backup

```
./backup_volumes.sh
```

5. Simulate failure

```
docker-compose down -v
```

6. Restore from backup file

```
./restore_volumes.sh ./docker_backups/<timestamp>
```

7. Re-run the Docker compose with 3 n8n nodes

```
docker-compose up -d --scale n8n=3
```