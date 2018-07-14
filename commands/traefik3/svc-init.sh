invoke docker service-set2 1 traefik_init "\
	--constraint node.hostname==node1of3 \
	--replicas 1 \
	--network cluster \
	--entrypoint \" storeconfig web  --zookeeper --zookeeper.endpoint=zk1:2181 --zookeeper.prefix=traefik\" \
    traefik:1.4 \
"