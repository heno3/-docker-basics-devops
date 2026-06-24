# 01 — Docker Fundamentals



## What is Docker?

Docker is a platform that allows you to package applications and their dependencies
into lightweight, portable units called **containers**.

---

## Core Concepts

| Concept | Description |
|---------|-------------|
| **Image** | A read-only template used to create containers |
| **Container** | A running instance of an image |
| **Docker Engine** | The runtime that builds and runs containers |
| **Docker Hub** | Public registry for sharing images |

---

## Container Lifecycle Commands

### Pull an image
```bash
docker pull nginx
```

### Run a container
```bash
docker run -d --name my-nginx -p 8080:80 nginx
```

### List running containers
```bash
docker ps
```

### List all containers (including stopped)
```bash
docker ps -a
```

### Stop a container
```bash
docker stop my-nginx
```

### Remove a container
```bash
docker rm my-nginx
```

### Remove an image
```bash
docker rmi nginx
```

---

## Key Flags Reference

| Flag | Meaning |
|------|---------|
| `-d` | Run in detached (background) mode |
| `--name` | Assign a name to the container |
| `-p host:container` | Map ports |
| `-it` | Interactive terminal |
| `--rm` | Auto-remove container when it stops |
