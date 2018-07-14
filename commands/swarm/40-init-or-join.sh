invoke pk parse-node-arg $1

if [ "$1" = "1" ]; then
	invoke ssh command $1 "sudo docker swarm init --advertise-addr $NODE"
else 
	token=$(invoke ssh command 1 "sudo docker swarm join-token -q $2") || exit 1
	invoke ssh command $1 "sudo docker swarm join --token $token $node1:2377"
fi
