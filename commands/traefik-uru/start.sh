#
# Problems
#

cmd="\
set -e;
sudo ufw allow 80/tcp;\
sudo ufw allow 8080/tcp;\
sudo ufw allow 443/tcp;\
sudo ufw reload;\
"
invoke ssh command 1 "$cmd"

tf=traefik15
invoke ssh sudo 1 "pkill $tf" || echo Already killed
invoke ssh command 1 "cat > traefik.toml" < $COMMAND_HOME/traefik.toml
invoke ssh sudo 1 "./$tf --logLevel=DEBUG --debug -c traefik.toml"
