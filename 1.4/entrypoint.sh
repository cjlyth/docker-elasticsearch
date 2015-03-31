#!/bin/bash

cmd="${1:-elasticsearch}"; shift;

mkdir -p /etc/elasticsearch/config
mkdir -p /var/lib/elasticsearch/{plugins,data,logs}

ES_OPTS="${@}"
[[ -z "${ES_OPTS}" ]] && {
	mkdir -p /data/{config,data,logs}
	ES_OPTS="${ES_OPTS} -Des.path.plugins=/var/lib/elasticsearch/plugins"
	ES_OPTS="${ES_OPTS} -Des.path.data=/var/lib/elasticsearch/data"
	ES_OPTS="${ES_OPTS} -Des.path.logs=/var/lib/elasticsearch/logs"
	ES_OPTS="${ES_OPTS} -Des.path.conf=/etc/elasticsearch/config"
	cp -Rn /opt/elasticsearch*/config/* /etc/elasticsearch/config
	cp -Rn /opt/elasticsearch*/plugins/* /var/lib/elasticsearch/plugins
}

[[ -z "$(grep -oe marvel.agent.enabled /etc/elasticsearch/config/elasticsearch.yml)" ]] && {
	echo "0"
echo '
marvel.agent.enabled: false
index.routing.allocation.disable_allocation: false
' >> /etc/elasticsearch/config/elasticsearch.yml	
}
# 
#sysctl -w vm.max_map_count=262144
#sysctl vm.max_map_count

case "${cmd}" in
	console) $0 elasticsearch console "${ES_OPTS}" ;;
    elasticsearch) ${PRODUCT_HOME}/bin/elasticsearch "${ES_OPTS}" ;;
	*) set -x; exec "${cmd}" "${@}" ;;
esac
