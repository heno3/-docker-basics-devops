#!/bin/bash
# ============================================
# Docker Volumes - Demo Commands
# Course: Docker Basics for DevOps (KodeKloud)
# Author: Haneen Tabasi
# ============================================

echo ">>> Creating a named volume..."
docker volume create my-volume

echo ">>> Listing all volumes..."
docker volume ls

echo ">>> Inspecting the volume..."
docker volume inspect my-volume

echo ">>> Running a container with the named volume..."
docker run -d --name db \
  -v my-volume:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  mysql:8.0

echo ">>> Waiting for MySQL to start..."
sleep 10

echo ">>> Listing running containers..."
docker ps

echo ">>> Writing test data into the volume via container..."
docker exec db mysql -usecret -psecret \
  -e "CREATE DATABASE testdb;" 2>/dev/null || true

echo ">>> Stopping and removing the container..."
docker stop db
docker rm db

echo ">>> Volume still exists after container removal..."
docker volume ls

echo ">>> Running a new container reusing the same volume..."
docker run -d --name db2 \
  -v my-volume:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  mysql:8.0

echo ">>> Stopping and removing second container..."
docker stop db2
docker rm db2

echo ">>> Cleaning up volume..."
docker volume rm my-volume

echo ">>> Demonstrating bind mount..."
mkdir -p /tmp/bind-demo
echo "<h1>Hello from Bind Mount!</h1>" > /tmp/bind-demo/index.html

docker run -d --name web \
  -v /tmp/bind-demo:/usr/share/nginx/html \
  -p 8080:80 \
  nginx:alpine

echo ">>> Container running with bind mount. Visit http://localhost:8080"
echo ">>> Press ENTER to stop and clean up..."
read

docker stop web
docker rm web
rm -rf /tmp/bind-demo

echo ">>> Done."
