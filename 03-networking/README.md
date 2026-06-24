# 03 — Docker Networking


## What is Docker Networking?

Docker networking allows containers to communicate with each other and with
the outside world. Docker creates a virtual network layer to manage this.

---

## Network Types

| Type | Description |
|------|-------------|
| **bridge** | Default network. Containers communicate via internal IP |
| **host** | Container shares the host's network stack |
| **none** | No networking. Fully isolated container |
| **custom bridge** | User-defined bridge with DNS-based container discovery |

---

## Network Commands

### List all networks
```bash
docker network ls
```

### Inspect a network
```bash
docker network inspect bridge
```

### Create a custom network
```bash
docker network create my-network
```

### Run a container on a custom network
```bash
docker run -d --name container1 --network my-network nginx:alpine
docker run -d --name container2 --network my-network nginx:alpine
```

### Test communication between containers
```bash
docker exec container1 ping container2
```

### Disconnect a container from a network
```bash
docker network disconnect my-network container1
```

### Remove a network
```bash
docker network rm my-network
```

---

## Why Use Custom Networks?

- Containers on the same custom network can reach each other **by name**
- Better isolation than the default bridge network
- Essential for multi-container applications (e.g. web app + database)
