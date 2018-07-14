# Test services for traefik https://docs.traefik.io/user-guide/swarm-mode/

invoke docker service-set 1 whoami2 "\
	--constraint=node.role==manager \
	--network mon \
	--replicas 3 \
    --label traefik.backend.loadbalancer.stickiness=true \
    --label traefik.port=80 \
    --label traefik.enable=true \
    --label traefik.frontend.rule=Host:swarm-ip \
	--label traefik.frontend.entryPoints=http2 \
    emilevauge/whoami"

