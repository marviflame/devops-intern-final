[![CI](https://github.com/marviflame/devops-intern-final/actions/workflows/ci.yml/badge.svg?branch=main&event=push)](https://github.com/marviflame/devops-intern-final/actions/workflows/ci.yml)


# Project Step One

## Devops-Intern-Final
This is the DevOps Intern Final Project
Name: Marvelous Olaoluwa
Date: 6th August 2026

## Project Description

To build a DevOps workflow using open-source tools with the like of the following:

(a) Linux 

(b) GitHub 

(c) Docker 

(d) CI/CD 

(e) Nomad 

(f) Monitoring

Each step will produced a real, usable output for the next, simulating a small but realistic DevOps pipeline. 


A simple Python script to print "Hello, DevOps!" was created
```python   
print("Hello, DevOps!")
```

To run it, use the following command:
```bash
chmod u+x hello.py
python3 hello.py
```
And here's a Bash script for (hello.py):
```bash
#!/bin/bash
echo "Hello, DevOps!"
```

To run it, use the following command:
```bash 
chmod u+x hello.py
./hello.py
```

# Project Step Two 

A folder scripts/. was created using this command:

```bash
mkdir scripts
```
A shell script called sysinfo.sh was written into the scripts/. folder

```bash
#!/bin/bash

whoami
date
df -h
```

To run it, use the following command:

```bash
chmod u+x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

# Project Step Three

Dockerfile was prepared to containerize the hello.py script.

```bash
FROM python:3.11-slim

WORKDIR /app

COPY hello.py .

CMD ["python", "hello.py"]
```
Docker was installed on the machine using Docker documentations curled from their official page 

The following commands were used to build docker image from the Dockerfile

#### 1. Build the image
```bash
docker build -t hello-devops .
```

#### 2. Verify the image was created
```bash
docker images | grep hello-devops
```
![image alt](https://github.com/marviflame/devops-intern-final/blob/c0a24710e1975547ecc99ed2e1627e5f6bda283f/docker_image1.png)


#### 3. Run the container
```bash
docker run hello-devops
```

![image alt](https://github.com/marviflame/devops-intern-final/blob/c0a24710e1975547ecc99ed2e1627e5f6bda283f/docker_image2.png)


## Step Four

Nomad can be used to run the Dockerized app as a background service job.

1. Docker image was built from the repo root file:

```bash
docker build -t hello-devops .
```

2. Nomad job was ran from the `nomad/` directory:

```bash
cd nomad
nomad job run hello.nomad
```

This uses the job definition in `nomad/hello.nomad` with a minimal `service` workload and low CPU/memory settings.


