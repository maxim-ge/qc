invoke docker service-set 1 tr_init "\
	--network c_net \
	--restart-condition none \
	--entrypoint \"\" \
    traefik:1.5 \
	storeconfig web --zookeeper --zookeeper.endpoint=zk1:2181 --zookeeper.prefix=tr \
		--acme \
		--acme.storage=traefik/acme/account \
		--acme.entryPoint=https --acme.OnHostRule=true \
		--acme.onDemand=false \
		--acme.email=contact@jmaitrehenry.ca \
		--docker \
      	--docker.swarmmode \
      	--docker.domain=jmaitrehenry.ca \
"
