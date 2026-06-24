# 04 — Docker Volumes

## What is Data Persistence in Docker?

By default, all data inside a container is lost when the container is removed.
Docker provides two main solutions to persist data: **Volumes** and **Bind Mounts**.

---

## Storage Types

| Type | Description |
|------|-------------|
| **Volume** | Managed by Docker, stored in `/var/lib/docker/volumes/` |
| **Bind Mount** | Maps a specific host directory into the container |
| **tmpfs Mount** | Stored in host memory only, never written to disk |

---

## When to Use Each

| Situation | Recommended |
|-----------|-------------|
| Database data persistence | Volume |
| Sharing config files from host | Bind Mount |
| Sensitive data that shouldn't be stored | tmpfs |

---

## Volume Commands

### Create a volume
```bash
docker volume create my-volume
```

### List all volumes
```bash
docker volume ls
```

### Inspect a volume
```bash
docker volume inspect my-volume
```

### Run a container with a volume
```bash
docker run -d --name db \
  -v my-volume:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  mysql:8.0
```

### Run a container with a bind mount
```bash
docker run -d --name web \
  -v $(pwd)/app:/usr/share/nginx/html \
  -p 8080:80 \
  nginx:alpine
```

### Remove a volume
```bash
docker volume rm my-volume
```

### Remove all unused volumes
```bash
docker volume prune
```

---

## Key Insight

Volumes are the **preferred** way to persist data in Docker because they are:
- Fully managed by Docker
- Easy to back up and migrate
- Sharable across multiple containers
