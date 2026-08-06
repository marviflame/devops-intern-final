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


It can also be accessed from the virtual machine's public ip-address


![image alt](https://github.com/marviflame/devops-intern-final/blob/e368980dd9cdf6813baf865beb6d5b3e1fa19f0d/docker_container.png)


# Project Step Four

A GitHub Actions workflow that runs python hello.py automatically on every push was created. You can take a took at the workflow on this repo.

Plus a status batch that was attached to this README file

![image alt](https://github.com/marviflame/devops-intern-final/blob/ea3befcbf98f6539f9635af721988f4f1580c4c5/readme_pic.png)




# Project Step Five

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
![image alt](https://github.com/marviflame/devops-intern-final/blob/955aaccb777c642caeb06fc75bc4e841dc6c4474/nomad.png)

This uses the job definition in `nomad/hello.nomad` with a minimal `service` workload and low CPU/memory settings.

There a nomad manifest in this repo that setup the nomad service in connection to docker container.


# Project Step Six

## Run the app with Nomad

Docker image that was built from the repo root:

```bash
docker build -t hello-devops:latest .
```

Then we start and run the Nomad job from the `nomad/` directory:

```bash
cd nomad
nomad agent -dev
nomad job run hello.nomad
```



This launches the Dockerized app as a Nomad service with minimal CPU and memory settings.

## Monitoring with Grafana Loki

A simple local Loki setup was added in [monitoring/loki_setup.txt](monitoring/loki_setup.txt).

### Start Loki

```bash
docker run -d --name loki -p 3100:3100 grafana/loki:2.9.2 --config.file=/etc/loki/local-config.yaml
```

### View container logs

```bash
docker logs hello-devsecops
```

### Check Loki readiness

```bash
curl http://127.0.0.1:3100/ready
```

A screenshot is optional, but the setup file contains the commands and basic forwarding notes.




