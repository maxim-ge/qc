Install kafka on node 1 and export port 9092

To verify use 

- cluster docker exec 1 kafka1 env
- cs 1 sudo docker service ls
- cs 1 sudo docker service logs kafka1
- cluster docker exec 1 zk1 bin/zkCli.sh ls /brokers/ids
- cluster docker exec 1 zk1 bin/zkCli.sh get /brokers/ids/1

# Links 

- https://github.com/wurstmeister/kafka-docker
- https://kafka.apache.org/documentation/#quickstart_multibroker
