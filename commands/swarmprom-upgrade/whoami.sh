invoke docker service-set 1 whoami "\
    --label traefik.port=80 \
    --network mon_net \
	--replicas 2 \
    --label traefik.backend.loadbalancer.stickiness=true \
    emilevauge/whoami"