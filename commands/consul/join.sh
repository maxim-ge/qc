node=${1:-1}
[ $node = "1" ] && (echo may not join node 1; exit 1)

invoke pk parse-node-arg 1
node1Addr=$NODE

prog=consul
prog_dir="${prog}_dir"



invoke ssh command $node $prog_dir/$prog join $node1Addr

