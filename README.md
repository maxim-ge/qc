# QC

Scripts to build quick swarm cluster

# TBD

Configure 3-nodes cluster, docker + swarm + prometheus + cassandra + kafka

## cluster pk 1

Configure access to all nodes by key

- https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

## cluster swarm (1|2|3) (manager|worker)

Configure swarm cluster

- https://www.digitalocean.com/community/tutorials/how-to-configure-the-linux-firewall-for-docker-swarm-on-ubuntu-16-04
- https://docs.docker.com/engine/reference/commandline/swarm_init/
- https://docs.docker.com/engine/reference/commandline/swarm_join-token/

Problems

- https://github.com/moby/moby/issues/23315 

KB
- list versions: cluster ssh 1 apt-cache madison docker-ce
- docker_version=docker-ce=17.12.0~ce-0~ubuntu
- cluster_user=cluster

## cluster prom1

Install prometheus on single host

?? firewall works even if comment out "sudo ufw allow 9090/tcp". Because localhost?

## cluster swarmprom

Configure swarmprom using https://github.com/stefanprodan/swarmprom

Problems

- Prometheus is configures with 2GB memory, which can exceeds VM parameters\
- Environment variables may not be used in case of `docker stack deploy` scenario, so must be replaced directly in `docker-compose.yml`

## cluster swarmpromsh

Configures swarmprom services one-by-one

## cluster swarmpromsh

Configure prometheus + telegraf to gather cluster statisics

- https://docs.docker.com/compose/compose-file
- https://docs.docker.com/engine/admin/prometheus/
- https://stefanprodan.com/2017/docker-swarm-instrumentation-with-prometheus/
- https://github.com/stefanprodan/swarmprom/blob/master/README.md

Problems:
- https://github.com/stefanprodan/swarmprom/issues/10

KB

- cluster ssh 1 curl 127.0.0.1:9323/metrics


## Install cassandra

## Install kafka

- connect to a node, create
- if `n` argument is not supplied generates next node number using nodes/next 
- creates a folder in nodes/

# KB

Docker

- cluster ssh 1 sudo docker node ls

Misc 

- date "+%Y-%m-%d %H:%M:%S" -d "1 hour"
- encrypt: openssl enc -aes-256-cbc -k PASS < Clusterfile  > Clusterfile.enc
- decrypt: openssl enc -d -aes-256-cbc -k PASS < Clusterfile.enc > Clusterfile.new
- print var referenced by $1: echo ${!1}
