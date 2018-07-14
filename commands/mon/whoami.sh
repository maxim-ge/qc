# Test services for traefik https://docs.traefik.io/user-guide/swarm-mode/

invoke docker service-set 1 whoami0 "\
    --publish 80:80 --publish 8080:8080 \
    --label traefik.port=80 \
    --network traefik-net \
	--replicas 5 \
    emilevauge/whoami"

invoke docker service-set 1 whoami1 "\
    --label traefik.port=80 \
    --network traefik-net \
	--replicas 5 \
    --label traefik.backend.loadbalancer.stickiness=true \
    emilevauge/whoami"