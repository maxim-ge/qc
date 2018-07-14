invoke ssh command 1 mkdir -p swarmprom
cat $COMMAND_HOME/docker-compose.yml | invoke ssh command 1 "sudo tee swarmprom/docker-compose.yml" > /dev/null
ADMIN_PASSWORD=pas
invoke ssh command 1 sudo sed -i "s/\$\{ADMIN_PASSWORD\}/$ADMIN_PASSWORD/g" swarmprom/docker-compose.yml
