cat $COMMAND_HOME/prometheus.yml | invoke ssh command 1 "sudo tee /etc/cluster/prometheus/prometheus.yml" > /dev/null
invoke ssh command 1 sudo killall -HUP prometheus
