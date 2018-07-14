echo "Enabling docker metrics for node $1..."
cat $COMMAND_HOME/docker-metrics.json | invoke ssh command $1 "sudo tee /etc/docker/daemon.json" > /dev/null
invoke ssh command $1 sudo service docker restart