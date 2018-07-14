Create 3 zookeeprs cluster

To verify use 

- cluster docker exec 1 zk1 bin/zkServer.sh status
- cluster docker exec 1 zk1 bin/zkCli.sh ls /
- cluster docker exec 1 zk1 bin/zkCli.sh create /zk myData
- cluster docker exec 1 zk1 bin/zkCli.sh set /zk data11111111111
- cluster docker exec 1 zk1 bin/zkCli.sh get /zk


Links

- https://hub.docker.com/_/zookeeper/
- http://mtitek.com/tutorials/zookeeper/zkCli.php