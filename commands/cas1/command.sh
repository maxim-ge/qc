invoke ssh sudo 1 docker network create -d overlay --opt encrypted userver || echo "Network already created"
invoke ssh sudo 1 docker volume create cassandra1-vol || echo "Volume already created"
invoke ssh sudo 1 docker volume create cassandra2-vol || echo "Volume already created"
invoke ssh sudo 1 docker volume create cassandra3-vol || echo "Volume already created"
invoke docker service-set 1 "$service" "\
	--constraint=node.hostname==$node1of3 \
	--network cluster \
	--env KAFKA_BROKER_ID=$id \
	--env KAFKA_ADVERTISED_LISTENERS=$service \
	--env KAFKA_ZOOKEEPER_CONNECT=zk1:2181 \
	--env KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=INSIDE:PLAINTEXT,OUTSIDE:PLAINTEXT \
	--env KAFKA_ADVERTISED_PROTOCOL_NAME=OUTSIDE \
	--env KAFKA_ADVERTISED_PORT=9094 \
	--env KAFKA_PROTOCOL_NAME=INSIDE \
	--env KAFKA_PORT=9092 \
	$image:$image_version \
	"
