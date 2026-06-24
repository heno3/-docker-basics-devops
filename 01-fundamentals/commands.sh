#!/bin/bash
# ============================================
# Docker Fundamentals - Demo Commands
# Course: Docker Basics for DevOps (KodeKloud)
# Author: Haneen Tabasi
# ============================================

echo ">>> Pulling nginx image..."
docker pull nginx

echo ">>> Running nginx container on port 8080..."
docker run -d --name my-nginx -p 8080:80 nginx

echo ">>> Listing running containers..."
docker ps

echo ">>> Inspecting container details..."
docker inspect my-nginx

echo ">>> Viewing container logs..."
docker logs my-nginx

echo ">>> Stopping the container..."
docker stop my-nginx

echo ">>> Listing all containers (including stopped)..."
docker ps -a

echo ">>> Removing the container..."
docker rm my-nginx

echo ">>> Removing the image..."
docker rmi nginx

echo ">>> Done."
