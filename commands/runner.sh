#!/bin/bash

trap catch_errors ERR;
function catch_errors() {
	set +x
	echo "!!! Script aborted";
	exit 1;
}

mkdir -p ./.logs
set -x
set -eo pipefail
export SHELLOPTS

echo ---------------------------------- `dirname $0`

(`dirname $0`/runner2.sh "$@" 2>&1 \
 | grep --line-buffered -Ev '\+* set \+x|\+* set \-x|\+* invoke|\+* trace') \
 | tee -a ./.logs/log-$(date +"%Y%m%d-%H%M%S")-$1-$2
#./commands/runner2.sh "$@"
