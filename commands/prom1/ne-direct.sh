#
# Not using docker
#

BASE_NAME=node_exporter-0.15.2.linux-amd64
invoke ssh command 1 curl -s -L https://github.com/prometheus/node_exporter/releases/download/v0.15.2/$BASE_NAME.tar.gz --output $BASE_NAME.tar.gz
invoke ssh command 1 tar xvfz $BASE_NAME.tar.gz
