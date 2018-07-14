#
#
invoke utils Clusterfile
dvar zk_version

createService(){
	id=$1
	service=zk$id
	nodeName=node${id}of3

	if [ 1 == $id ];then
		servers="server.1=0.0.0.0:2888:3888 server.2=zk2:2888:3888 server.3=zk3:2888:3888"
	fi
	if [ 2 == $id ];then
		servers="server.1=zk1:2888:3888 server.2=0.0.0.0:2888:3888 server.3=zk3:2888:3888"
	fi
	if [ 3 == $id ];then
		servers="server.1=zk1:2888:3888 server.2=zk2:2888:3888 server.3=0.0.0.0:2888:3888"
	fi

	invoke ssh sudo 1 docker network create -d overlay --opt encrypted c_net || trace network already exists
	invoke ssh sudo 1 docker service rm $service || trace "service $service does not exist yet"
	invoke docker service-set 1 "$service" "\
	--constraint node.hostname==$nodeName \
	--network c_net \
	--env ZOO_MY_ID=$id \
	--env ZOO_SERVERS=\"$servers\" \
	zookeeper:$zk_version \
	"
}

createService 1
createService 2
createService 3
