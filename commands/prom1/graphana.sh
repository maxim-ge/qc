invoke ssh command 1 sudo mkdir -p /etc/cluster/graphana

invoke ssh command 1 "\
sudo docker run \
  -d \
  -p 3000:3000 \
  --name=grafana \
  -v /etc/cluster/graphana:/var/lib/grafana \
  -e \"GF_SERVER_ROOT_URL=http://swarm-ip\" \
  -e \"GF_SECURITY_ADMIN_PASSWORD=admin\" \
  grafana/grafana
"

# wait for api
set +e
 while ! invoke prom1 gapi GET /api/user/preferences
  do
    sleep 1
  done
set -e


invoke prom1 g-install-ds
invoke prom1 g-install-db