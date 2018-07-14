# Test services for traefik https://docs.traefik.io/user-guide/swarm-mode/

invoke docker service-set 1 whoami "\
	--constraint=node.role==manager \
    --publish 8080:80 \
	--replicas 1 \
    emilevauge/whoami"
