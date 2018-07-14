cat $COMMAND_HOME/zktr2.yml | invoke ssh command 1 "cat > zktr.yml"
invoke ssh sudo 1 "docker stack deploy --compose-file zktr.yml c"