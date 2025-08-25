FROM ubuntu:22.04

# Install Python3 and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Flask and MySQL connector
RUN pip3 install flask flask-mysql

# Copy app code into container
COPY . /opt/source-code
WORKDIR /opt/source-code

# Expose Flask port
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=/opt/source-code/app.py

# Run Flask when the container starts
CMD ["flask", "run", "--host=0.0.0.0"]
