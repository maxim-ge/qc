pwd=${1:-admin}

echo "Cloning swarmprom repo..."
invoke ssh command 1 "[ -d swarmprom ] || git clone https://github.com/stefanprodan/swarmprom.git"

echo "Configuring docker-compose.yml..."
cat $COMMAND_HOME/docker-compose.yml | invoke ssh command 1 "sudo tee swarmprom/docker-compose.yml" > /dev/null
invoke ssh command 1 sudo sed -i "s/\$\{ADMIN_USER\}/admin/g" swarmprom/docker-compose.yml
invoke ssh command 1 sudo sed -i "s/\$\{ADMIN_PASSWORD\}/$pwd/g" swarmprom/docker-compose.yml
invoke ssh command 1 sudo sed -i "s/\$\{SLACK_URL\}/https:\\\/\\\/hooks.slack.com\\\/services\\\/aaaaaaaaaa\\\/bbbbbbbbbbb/g" swarmprom/docker-compose.yml
invoke ssh command 1 sudo sed -i "s/\$\{SLACK_CHANNEL\}/devops-alerts/g" swarmprom/docker-compose.yml
invoke ssh command 1 sudo sed -i "s/\$\{SLACK_USER\}/maxim.ge@gmail.com/g" swarmprom/docker-compose.yml

echo "Deploying swarmprom stack"
invoke ssh command 1 "cd swarmprom; sudo docker stack deploy --compose-file docker-compose.yml mon"