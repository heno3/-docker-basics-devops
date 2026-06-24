# 02 — Docker Images & Dockerfile

## What is a Docker Image?

A Docker image is a read-only template that contains everything needed to run
an application: code, runtime, libraries, and configuration.

---

## Useful Image Commands

### Search for an image
```bash
docker search nginx
```

### Pull an image
```bash
docker pull nginx:alpine
```

### List local images
```bash
docker images
```

### Remove an image
```bash
docker rmi nginx:alpine
```

### Inspect an image
```bash
docker image inspect nginx
```

---

## What is a Dockerfile?

A `Dockerfile` is a text file with instructions to build a custom Docker image.

## Dockerfile Instructions Reference

| Instruction | Purpose |
|-------------|---------|
| `FROM` | Base image to build upon |
| `WORKDIR` | Set working directory inside container |
| `COPY` | Copy files from host to container |
| `RUN` | Execute commands during build |
| `EXPOSE` | Document the port the app listens on |
| `CMD` | Default command to run when container starts |

---

## Build & Run the Custom Image

```bash
# Build the image
docker build -t my-web-app:1.0 .

# Run the container
docker run -d --name web -p 8080:80 my-web-app:1.0

# Open in browser
# http://localhost:8080

# Stop and clean up
docker stop web
docker rm web
docker rmi my-web-app:1.0
```
