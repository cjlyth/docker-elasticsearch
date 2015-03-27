#!/bin/bash

cmd="${1:-elasticsearch}"; shift;

ES_OPTS="${@}"
[[ -z "${ES_OPTS}" ]] && {
	mkdir -p /data/{config,data,logs}
	ES_OPTS="${ES_OPTS} -Des.path.data=/data/data"
	ES_OPTS="${ES_OPTS} -Des.path.logs=/data/logs"
	
	ES_OPTS="${ES_OPTS} -Des.config=/data/config/elasticsearch.yml"
}

case "${cmd}" in
	console) $0 elasticsearch console "${ES_OPTS}" ;;
    elasticsearch) ${PRODUCT_HOME}/bin/elasticsearch "${ES_OPTS}" ;;
	*) set -x; exec "${cmd}" "${@}" ;;
esac
