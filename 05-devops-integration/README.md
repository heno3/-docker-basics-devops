# 05 — Docker in DevOps & CI/CD Integration

## What is CI/CD?

CI/CD stands for **Continuous Integration / Continuous Delivery**.
It automates building, testing, and deploying applications on every code change.

---

## Docker in a CI/CD Pipeline

| Stage | Role of Docker |
|-------|---------------|
| **Build** | Build a Docker image from the Dockerfile |
| **Test** | Run the container and verify it works |
| **Push** | Push the image to a registry (Docker Hub / GHCR) |
| **Deploy** | Pull and run the image on the server |

---

## This Section Demonstrates

- Writing a `Dockerfile` for a web application
- Automating the build using **GitHub Actions**
- Running a container health check in the pipeline
- A complete CI workflow triggered on every push to `main`

---

## GitHub Actions Workflow

The workflow file is located at `.github/workflows/docker-build.yml`.

It performs the following steps automatically:
1. Checkout the repository
2. Build the Docker image
3. Run the container
4. Verify the container is running
5. Clean up

---

## How to Trigger the Pipeline

Simply push any change to the `main` branch:

```bash
git add .
git commit -m "trigger CI pipeline"
git push
```

Then go to your GitHub repository → **Actions** tab to watch it run.
