invoke docker service-set2 1 traefik-init "\
	--constraint 'node.hostname==node1of3' \
	--replicas 1 \
	--network cluster \
    traefik:1.4\
	\"echo OK\" \
"
