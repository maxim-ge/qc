# Problems
#   My, solved, outdated doc https://github.com/containous/traefik/issues/2684
#   My, solved, [file]  https://stackoverflow.com/questions/48223276/traefik-does-not-forward-requests-to-a-normal-non-docker-backend
#   Traefik doesn't acknowledge containers started using docker stack deploy https://github.com/containous/traefik/issues/994
#       

#  https://docs.traefik.io/user-guide/swarm-mode/
# https://docs.traefik.io/configuration/backends/docker/
# https://docs.traefik.io/user-guide/docker-and-lets-encrypt/
# https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-16-04

invoke ssh sudo 1 docker network create --driver=overlay traefik-net || trace net already exists?

invoke docker service-set 1 "traefik" "\
--constraint=node.role==manager \
--publish 80:80 --publish 8080:8080 \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
--network traefik-net \
traefik \
--docker \
--debug \
--docker.swarmmode \
--docker.domain=traefik \
--docker.watch \
--web"