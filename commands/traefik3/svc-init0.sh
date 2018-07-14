invoke docker service-set2 1 traefik_init "\
	--constraint node.hostname==node1of3 \
	--replicas 1 \
	--network cluster \
    containous/traefik:latest"