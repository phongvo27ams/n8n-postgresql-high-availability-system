# Useful Commands for Running and Testing an N8N HA System

1. Run the Docker compose with 3 n8n nodes

```
docker-compose up -d --scale n8n=3
```

2. Stop and start a service

```
docker stop n8n_node_1
docker start n8n_node_1
docker stop n8n-nginx
docker stop n8n-postgres
```

3. Check out logs

```
docker logs n8n_node_1
docker logs n8n_node_2
```

4. List all running containers

```
docker ps -a
```

5. Check avalability at localhost

```
curl -i http://localhost
```

6. Take a Backup

```
./backup_volumes.sh
```

7. Simulate failure

```
docker-compose down -v
```

8. Restore from backup file

```
./restore_volumes.sh ./docker_backups/<timestamp>
```

9. Run the Docker compose with 3 n8n nodes

```
docker-compose up -d --scale n8n=3
```