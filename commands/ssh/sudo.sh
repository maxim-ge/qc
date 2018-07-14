invoke pk parse-node-arg $1

shift
ssh -i $CLUSTER_KEY_FILE $cluster_user@$NODE "sudo $*"