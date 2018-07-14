pwd=${1:-admin}

(cat $COMMAND_HOME/Caddyfile  | invoke ssh command 1 "sudo docker config create Caddyfile -") || trace "Caddy config already exists"

invoke docker service-set 1 "mon_caddy" " \
--mode replicated \
--replicas 1 \
--constraint 'node.role == manager' \
--publish published=3000,target=3000 \
--publish published=9090,target=9090 \
--publish published=9093,target=9093 \
--publish published=9094,target=9094 \
--env ADMIN_USER=admin \
--env ADMIN_PASSWORD=${pwd} \
--limit-memory 128M \
--reserve-memory 64M \
--health-cmd 'curl -f http://localhost:3000' \
--health-interval 5s \
--health-timeout 1s \
--health-retries 5 \
--config source=Caddyfile,target=/etc/caddy/Caddyfile \
stefanprodan/caddy \
"
