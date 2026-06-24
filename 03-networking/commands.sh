#!/bin/bash
# ============================================
# Docker Networking - Demo Commands
# Course: Docker Basics for DevOps (KodeKloud)
# Author: Haneen Tabasi
# ============================================

echo ">>> Listing all default networks..."
docker network ls

echo ">>> Inspecting the default bridge network..."
docker network inspect bridge

echo ">>> Creating a custom network..."
docker network create my-network

echo ">>> Running two containers on the custom network..."
docker run -d --name container1 --network my-network nginx:alpine
docker run -d --name container2 --network my-network nginx:alpine

echo ">>> Listing running containers..."
docker ps

echo ">>> Testing communication between containers by name..."
docker exec container1 ping -c 4 container2

echo ">>> Inspecting the custom network..."
docker network inspect my-network

echo ">>> Stopping and removing containers..."
docker stop container1 container2
docker rm container1 container2

echo ">>> Removing the custom network..."
docker network rm my-network

echo ">>> Done."
