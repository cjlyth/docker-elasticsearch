#!/bin/bash

sudo rm -Rf /tmp/es/{data,logs,plugins}

# mkdir -p /tmp/es/config
# echo '
# cluster:
#   name: cl_cluster
# node:
#   name: cl_node
# marvel.agent.enabled: false
# index.routing.allocation.disable_allocation: false
# ' > /tmp/es/config/elasticsearch.yml


#sysctl -w vm.max_map_count=262144


docker stop es14 es142 es15 | xargs docker rm

docker build -t cjlyth/elasticsearch:1.4 1.4 && {

docker run -d --name=es142 \
	-v /tmp/es/config:/etc/elasticsearch/config:ro \
	cjlyth/elasticsearch:1.4

docker run -it --rm -p 9200:9200 -p 9300:9300 --name=es14 \
	-v /tmp/es/data:/var/lib/elasticsearch/data \
	-v /tmp/es/logs:/var/lib/elasticsearch/logs \
	-v /tmp/es/plugins:/var/lib/elasticsearch/plugins \
	-v /tmp/es/config:/etc/elasticsearch/config \
	cjlyth/elasticsearch:1.4
}
