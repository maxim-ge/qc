#
#
invoke utils Clusterfile

service=ubuntu16

invoke ssh sudo 1 docker network create -d overlay --opt encrypted cluster || trace network already exists
invoke ssh sudo 1 docker service rm $service || trace "service $service does not exist yet"

invoke docker service-set 1 "$service" "\
--constraint=node.hostname==node1of3 \
--network cluster \
ubuntu:16.04 \
"
