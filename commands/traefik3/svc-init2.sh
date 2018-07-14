cat << EOF | invoke ssh command 1 "cat > traefik-compose.yml"
version: "3.4"
services:
  init:
    image: traefik:1.4@sha256:9c299d9613cb01564c8219f4bc56ecc55f30d8f06d35cf3ecf83a85426c13225
    command:
      - "storeconfig"
      - "--web"
      - "--entrypoints=Name:http Address::80 Redirect.EntryPoint:https"
      - "--entrypoints=Name:https Address::443 TLS"
      - "--defaultentrypoints=http,https"
      - "--acme"
      - "--acme.storage=traefik/acme/account"
      - "--acme.entryPoint=https"
      - "--acme.OnHostRule=true"
      - "--acme.onDemand=false"
      - "--acme.email=contact@jmaitrehenry.ca"
      - "--docker"
      - "--docker.swarmmode"
      - "--docker.domain=jmaitrehenry.ca"
      - "--docker.watch"
      - "--zookeeper"
      - "--zookeeper.endpoint=zk1:2181"
      - "--zookeeper.prefix=traefik"
    networks:
      - cluster
    deploy:
      restart_policy:
        condition: on-failure
networks:
  cluster:
    driver: overlay
EOF

invoke ssh command 1 "sudo docker stack deploy --compose-file traefik-compose.yml traefik"