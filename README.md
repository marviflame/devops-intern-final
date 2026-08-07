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


It can also be accessed from the virtual machine's public ip-address: http://54.167.81.208:80


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


## Monitoring with Grafana Loki Locally

I created a Docker network using this command
```bash 
docker network create loki-net
```


I started Loki with its config mounted into the container using this command
```bash
docker run -d --name loki --network loki-net -p 3100:3100 -v "$PWD/loki-config.yml:/etc/loki/local-config.yaml" grafana/loki:latest -config.file=/etc/loki/local-config.yaml
```

I configured Loki with port 3100, a local config file, a basic filesystem storage under /tmp/loki
The config file that was used can be found inside this repo monitoring/loki-config.yml


Then I use Promtail


I started Promtail in the same Docker network with the following command
```bash
docker run -d --name promtail --network loki-net -v "$PWD/promtail-config.yml:/etc/promtail/promtail.yaml" -v /var/lib/docker/containers:/var/lib/docker/containers:ro grafana/promtail:latest -config.file=/etc/promtail/promtail.yaml
```

The Promtail config in promtail-config.yml was set to read Docker container JSON logs, scrape them from /var/lib/docker/containers//.log forward them to Loki



Here is a Loki API ready to collect logs
![image alt](https://github.com/marviflame/devops-intern-final/blob/dc1949537d7a7894ed662d5e55408cfcdc26268a/monitoring/loki-api.png)


I used these commands used to view logs



docker ps # for running containers
![image alt](https://github.com/marviflame/devops-intern-final/blob/dc1949537d7a7894ed662d5e55408cfcdc26268a/cli.png)



docker logs promtail #for promtail logs
curl http://54.167.81.208:3100/ready #for Loki readiness
![image alt](https://github.com/marviflame/devops-intern-final/blob/dc1949537d7a7894ed662d5e55408cfcdc26268a/monitoring/loki-readiness.png)






