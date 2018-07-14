invoke ssh sudo 1 docker service rm traefik || trace "service traefik does not exist yet"
invoke ssh command 1 "sudo docker config rm traefik.toml" || trace "traefik.toml does not exists yet"
(cat $COMMAND_HOME/traefik.toml  | invoke ssh command 1 "sudo docker config create traefik.toml -")

invoke docker service-set 1 "traefik" "\
--constraint=node.role==manager \
--publish 80:80 \
--publish 82:82 \
--publish 8080:8080 \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
--network mon \
--config source=traefik.toml,target=/etc/traefik/traefik.toml \
traefik \
--debug \
"

cmd="\
set -e;
sudo ufw allow 80/tcp;\
sudo ufw allow 82/tcp;\
sudo ufw allow 8080/tcp;\
sudo ufw reload;\
"
invoke ssh command 1 "$cmd"
