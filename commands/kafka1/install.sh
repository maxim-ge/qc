#
# https://github.com/wurstmeister/kafka-docker
#
# Problem https://github.com/wurstmeister/kafka-docker/issues/211
#
invoke utils Clusterfile
image=wurstmeister/kafka
image_version=$kafka_version
dvar image_version

createService(){
	service=kafka1
	nodeName=node1of3

	invoke ssh sudo 1 docker network create -d overlay --opt encrypted cluster || trace cluster network already exists
	invoke ssh sudo 1 docker service rm $service || trace "service $service does not exist yet"
	invoke docker service-set 1 "$service" "\
	--constraint=node.hostname==$nodeName \
	--network cluster \
	--env KAFKA_BROKER_ID=1 \
	--env KAFKA_ADVERTISED_LISTENERS=$service \
	--env KAFKA_ZOOKEEPER_CONNECT=zk1:2181 \
	--env KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=INSIDE:PLAINTEXT,OUTSIDE:PLAINTEXT \
	--env KAFKA_ADVERTISED_PROTOCOL_NAME=OUTSIDE \
	--env KAFKA_ADVERTISED_PORT=9094 \
	--env KAFKA_PROTOCOL_NAME=INSIDE \
	--env KAFKA_PORT=9092 \
 	--publish 9092:9092 \
	$image:$image_version \
	"
}

createService
invoke ssh command 1 'sudo ufw allow 22/tcp'
invoke ssh command 1 'sudo ufw reload'
#	--env KAFKA_HOST_NAME=$service \
