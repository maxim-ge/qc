#
# !!! If service exists it is removed then created
#


node=$1
service=$2
shift
shift

[ -n "$node" ] || exit 1
[ -n "$service" ] || exit 1

invoke ssh command 1 "sudo docker service ps $service" && (
  trace service $service already exists, removing...
  invoke ssh command 1 "sudo docker service rm $service"
)

invoke ssh command $node "sudo docker service create -d --name $service $@"