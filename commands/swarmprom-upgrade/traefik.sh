# Problems
#   My, solved, outdated doc https://github.com/containous/traefik/issues/2684
#   My:  https://stackoverflow.com/questions/48223276/traefik-does-not-forward-requests-to-a-normal-non-docker-backend

# https://docs.traefik.io/user-guide/swarm-mode/
# https://docs.traefik.io/configuration/backends/docker/
# https://docs.traefik.io/user-guide/docker-and-lets-encrypt/
# https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-16-04

(cat $COMMAND_HOME/traefik.toml  | invoke ssh command 1 "sudo docker config create traefik.toml -") || trace "traefik.toml already exists"

invoke docker service-set 1 "traefik" "\
--constraint=node.role==manager \
--publish 80:80 \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
--network mon_net \
--config source=traefik.toml,target=/etc/traefik/traefik.toml \
traefik \
--docker \
--debug \
--docker.swarmmode \
--docker.domain=traefik \
--docker.watch \
"