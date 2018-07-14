#
# https://blog.docker.com/2016/12/understanding-docker-networking-drivers-use-cases/
#

invoke ssh sudo 1 docker network create -d overlay --opt encrypted mon