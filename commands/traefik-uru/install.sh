#
# Problems
#

tf=traefik15
invoke ssh command 1 "[ -f $tf ]" || 
	invoke ssh command 1 "curl -s -k -L https://github.com/containous/traefik/releases/download/v1.5.0-rc5/traefik_linux-386 > $tf"
invoke ssh command 1 chmod +x $tf
cmd="\
set -e;
sudo ufw allow 80/tcp;\
sudo ufw allow 8080/tcp;\
sudo ufw allow 433/tcp;\
sudo ufw reload;\
"
invoke ssh command 1 "$cmd"

invoke ssh command 1 "cat > traefik.toml" < $COMMAND_HOME/traefik.toml

invoke ssh sudo 1 "rm tl.txt" || echo tl.txt already deleted
invoke ssh sudo 1 "rm al.txt" || echo al.txt already deleted

