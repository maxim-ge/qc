prog=consul
prog_dir="${prog}_dir"
node=${1:-1}
invoke ssh command $node mkdir -p $prog_dir
invoke ssh command $node "[ -f $prog_dir/$prog.zip ]" || (
	invoke ssh command $node "curl -s -k -L https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_linux_386.zip > $prog_dir/$prog.zip"
)

invoke ssh command $node "[ -f $prog_dir/$prog ]" || (
	invoke ssh command $node sudo apt-get install unzip
	invoke ssh command $node unzip $prog_dir/$prog.zip -d $prog_dir
)

# https://www.consul.io/docs/agent/options.html#ports
cmd="\
set -e;
sudo ufw allow 8300/tcp;\
sudo ufw allow 8301/tcp;\
sudo ufw allow 8301/udp;\
sudo ufw allow 8302/tcp;\
sudo ufw allow 8302/udp;\
sudo ufw reload;\
"
invoke ssh command $node "$cmd"
