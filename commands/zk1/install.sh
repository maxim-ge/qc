#
#
invoke utils Clusterfile
dvar zk_version

service=zk1

invoke ssh sudo 1 docker network create -d overlay --opt encrypted cluster || trace network already exists
invoke ssh sudo 1 docker service rm $service || trace "service $service does not exist yet"

invoke docker service-set 1 "$service" "\
--constraint=node.role==manager \
--network cluster \
--publish 2181:2181 \
--env ZOO_MY_ID=1 \
zookeeper:$zk_version \
"