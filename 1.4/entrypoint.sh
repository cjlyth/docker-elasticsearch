#!/bin/bash

cmd="${1:-elasticsearch}"; shift;
case "${cmd}" in
	console) $0 elasticsearch console "${@}" ;;
    elasticsearch) ${PRODUCT_HOME}/bin/elasticsearch "${@}" ;;
	*) set -x; exec "${cmd}" "${@}" ;;
esac

# #!/bin/bash
# set -e

# cmd="${1}"; shift;
# case "$cmd" in
#     elasticsearch) /opt/elasticsearch/bin/elasticsearch ;;
# 	*) exec "$cmd" "$@" ;;
# esac


# -Des.cluster.name=
# -Des.node.name=
# -Des.network.host=10.0.0.4
# -Des.config=/path/to/config/file