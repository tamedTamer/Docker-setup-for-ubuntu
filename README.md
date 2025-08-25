# Flask + Ubuntu Dockerfile

This example shows how to containerize a simple **Flask application** on top of an **Ubuntu base image**.

---

## Dockerfile Breakdown

```dockerfile
FROM ubuntu:22.04
```
Use **Ubuntu 22.04 LTS** as the base image.  

```dockerfile
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
```
 Install **Python 3** and **pip3**.  
 `rm -rf /var/lib/apt/lists/*` cleans up cache to make the image smaller.

```dockerfile
RUN pip3 install flask flask-mysql
```
 Install **Flask** (web framework) and **flask-mysql** (MySQL integration).  
This ensures dependencies are available inside the container.

```dockerfile
COPY . /opt/source-code
WORKDIR /opt/source-code
```
 Copy your source code into `/opt/source-code` inside the container.  
 Set `/opt/source-code` as the **working directory**, so commands run from there by default.

```dockerfile
EXPOSE 5000
```
 Tell Docker that this container will use **port 5000** (the default for Flask).

```dockerfile
ENV FLASK_APP=/opt/source-code/app.py
```
 Set the environment variable **FLASK_APP** so Flask knows what to run.

```dockerfile
CMD ["flask", "run", "--host=0.0.0.0"]
```
 Start the Flask server when the container launches.  
 `--host=0.0.0.0` makes the app reachable from outside the container (not just localhost).

---

## Usage

### Build the image
```bash
docker build -t flask-ubuntu .
```

### Run the container
```bash
docker run -p 5000:5000 flask-ubuntu
```

### Access the app
Open [http://localhost:5000](http://localhost:5000) in your browser 🚀
