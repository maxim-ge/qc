#
# One server
#

prog=consul
prog_dir="${prog}_dir"
node=${1:-1}

invoke pk parse-node-arg $node

invoke ssh command $node mkdir -p $prog_dir/data
invoke ssh command $node mkdir -p $prog_dir/conf

[ $node == 1 ] && server_opt="-server -bootstrap-expect=1" || server_opt=""
invoke ssh command $node $prog_dir/consul agent $server_opt \
    -data-dir=$prog_dir/data -node="node$node" -bind=$NODE \
    -config-dir=$prog_dir/conf

