Install kafka1, kafka2, kafka3 on 1-3 nodes

To verify use 

- cluster docker exec 1 kafka1 env
- cs 1 sudo docker service ls
- cs 1 sudo docker service logs kafka1
- cluster docker exec 1 zk1 bin/zkCli.sh ls /brokers/ids
- cluster docker exec 1 zk1 bin/zkCli.sh get /brokers/ids/1

# Links 

JMX

- https://github.com/vladimirvivien/jmx-cli
- https://cwiki.apache.org/confluence/display/KAFKA/jmxterm+quickstart

Monitor

- https://github.com/danielqsj/kafka_exporter
- https://www.robustperception.io/monitoring-kafka-with-prometheus/
- https://signalfx.com/blog/how-we-monitor-and-run-kafka-at-scale/

Misc

- https://github.com/wurstmeister/kafka-docker
- https://kafka.apache.org/documentation/#quickstart_multibroker
