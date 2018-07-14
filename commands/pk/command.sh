invoke pk parse-node-arg $1

echo Public key authentication will be configured for $NODE_REF '('$NODE')'

# Generate key if not exist yet
if [ ! -f $CLUSTER_KEY_FILE ]; then
	mkdir -p $CLUSTER_FOLDER	
	ssh-keygen -f $CLUSTER_KEY_FILE -N "" > /dev/null
	echo NOTE: Key $CLUSTER_KEY_FILE has been generated
fi

# Create temp folder

TEMP=`mktemp -d --suffix=cluster`
trap "rm -rf $TEMP" EXIT

# Copy files to TEMP and pushd there

cat $COMMAND_HOME/config-host.sh | sed s/'$cluster_user'/$cluster_user/ | invoke utils unix-eols > $TEMP/config-host.sh
cp $CLUSTER_KEY_FILE.pub $TEMP
CURDIR=`pwd`
pushd $TEMP > /dev/null

# tar and pass to remote shell

tar -cz cluster_key.pub  config-host.sh | ssh root@$NODE "tar -xz; cat ./config-host.sh | sh" || exit 1

popd > /dev/null

echo Node $NODE_REF '('$NODE')' hase ben configured for public key authentication
echo Use: ssh -i $CLUSTER_KEY_FILE $cluster_user@$NODE
