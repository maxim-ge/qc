#cs 1 sudo docker exec zk1.1.w52aakj51iqfxu6t5jx2tp1d7 ls

node=$1
service=$2

serviceName=$(invoke ssh sudo $node docker ps --filter "name=$service." --format "{{.Names}}")
if [ -z "$serviceName" ]; then
	echo Service $service not found
	exit 1
fi
shift
shift
invoke ssh sudo $node docker exec $serviceName "$@"