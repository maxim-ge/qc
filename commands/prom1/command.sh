invoke ssh command 1 sudo mkdir -p /etc/cluster/prometheus
cat $COMMAND_HOME/prometheus.yml | invoke ssh command 1 "sudo tee /etc/cluster/prometheus/prometheus.yml" > /dev/null

# Firewall for prometheus
invoke ssh command 1 "sudo ufw allow 9090/tcp"
# Firewall for node_exporter
invoke ssh command 1 "sudo ufw allow 9100/tcp"
# cadvisor
invoke ssh command 1 "sudo ufw allow 8877/tcp"
invoke ssh command 1 "sudo ufw reload"

invoke ssh command 1 "\
sudo docker run --name prom1 -d -p 9090:9090 -v /etc/cluster/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
prom/prometheus
"

invoke prom1 ne-docker

invoke prom1 graphana

invoke prom1 cadvisor