#
# Parse config and prepare NODE and NODE_REF vars using optional $1
#
#

set +x

CLUSTER_FOLDER=.cluster
CLUSTER_KEY_FILE=$CLUSTER_FOLDER/cluster_key

invoke utils Clusterfile
set +x

if [ -z "$1" ]; then
  NODE_REF=node1
else
  NODE_REF=$1
fi

if [[ $NODE_REF =~ ^[0-9]*$ ]]; then
  NODE_REF=node$NODE_REF
fi

NODE=${!NODE_REF}

if [ -z "$NODE" ]; then
	die Address of "'"$NODE_REF"'" is not defined in Clusterfile
fi

set -x