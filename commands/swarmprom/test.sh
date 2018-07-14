invoke ssh command 1 mkdir -p swarmprom
invoke ssh command 1 "echo FOOVAR=val16 > .env"
cat $COMMAND_HOME/dc-test.yml | invoke ssh command 1 "sudo tee docker-compose.yml" > /dev/null
invoke ssh command 1 "sudo -E docker stack deploy --compose-file docker-compose.yml test"

FOOVAR=val55 docker stack deploy --compose-file docker-compose.yml test