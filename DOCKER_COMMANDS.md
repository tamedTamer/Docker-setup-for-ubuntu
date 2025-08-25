# Basic Docker Commands Guide

This is a quick reference for the most commonly used Docker commands in an average project.

---

## 1. Build an image
```bash
docker build -t myimage .
```
- `-t myimage` → name the image `myimage`  
- `.` → use the current directory’s Dockerfile

---

## 2. List images
```bash
docker images
```

---

## 3. Run a container
```bash
docker run -p 5000:5000 myimage
```
- `-p 5000:5000` → maps container port 5000 to host port 5000

---

## 4. List running containers
```bash
docker ps
```

To see **all containers** (including stopped ones):
```bash
docker ps -a
```

---

## 5. Stop a running container
```bash
docker stop <container_id_or_name>
```

---

## 6. Remove a container
```bash
docker rm <container_id_or_name>
```

---

## 7. Remove an image
```bash
docker rmi <image_id_or_name>
```

---

## 8. View logs of a container
```bash
docker logs <container_id_or_name>
```

---

## 9. Access a container’s shell
```bash
docker exec -it <container_id_or_name> /bin/bash
```

---

## 10. Clean up unused resources
```bash
docker system prune
```
⚠️ Removes **all stopped containers, unused networks, and dangling images**.

---

This covers the basics you’ll need for most projects 🚀
