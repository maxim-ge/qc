#!/bin/bash

set +x
COMMAND=$1
if [ -z "$COMMAND" ]; then
	COMMAND=help
else
	shift
fi

WD=`pwd`
COMMANDS_HOME=`dirname $0`
COMMAND_HOME=$COMMANDS_HOME/$COMMAND


SCRIPT=$COMMANDS_HOME/$COMMAND/$1.sh
if [ -f $SCRIPT ]; then
	shift
else
	SCRIPT=$COMMANDS_HOME/$COMMAND/command.sh
fi
if [ ! -f $SCRIPT ]; then
	echo "Script '$SCRIPT' does not exist"
	exit 1
fi

trace(){
	set +x
	printf "\e[1;32m%s\e[0m\n" "$*"
	set -x
}

error(){
	printf "\e[1;31m" 1>&2
	echo "$@" 1>&2
	printf "\e[0m" 1>&2
# https://stackoverflow.com/questions/5412761/using-colors-with-printf
# define KNRM  "\x1B[0m"
# define KRED  "\x1B[31m"
# define KGRN  "\x1B[32m"
# define KYEL  "\x1B[33m"
# define KBLU  "\x1B[34m"
# define KMAG  "\x1B[35m"
# define KCYN  "\x1B[36m"
# define KWHT  "\x1B[37m"
}

debug_nested(){
	if [ "$1" -eq "0" ]; then
		local IDX1=1
		local IDX2=0
	fi
	if [ "$1" -eq "1" ]; then
		local IDX1=2
		local IDX2=1
	fi
	printf "\e[1;32mDEBUG: "
	shift
	echo "$@" "<= ${BASH_SOURCE[$IDX1]}: ${BASH_LINENO[$IDX2]}"
	printf "\e[0m"
}

debug(){
	debug_nested 0 "$@"
}
debug_echo(){
	echo "DEBUG: $1: ${BASH_SOURCE[1]}: ${BASH_LINENO[0]}" 
}

doeq(){
	(eval "$@")  || die "Error executing: $*"
}

doe(){
#	debug_nested 1 "doe: $*"
	doeq "$@"
}

die(){
	echo "FATAL: $*"
	exit 1
}


dvar(){
	set +x
#	echo DEBUG: $1=${!1}: "${BASH_SOURCE[1]}: line ${BASH_LINENO[0]}:"
	debug_nested 1 "$1=${!1}"
	set -x
}

invoke(){
	set +x
	local INV1=$1
    local INV2=$2
	shift
	shift
	set -x
	. $COMMANDS_HOME/$INV1/$INV2.sh "$@"
}

PLATFORM='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   PLATFORM='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   PLATFORM='freebsd'
elif [[ "$unamestr" =~ MSYS.* ]]; then
   PLATFORM='windows'
fi

ARGS=("$@")
set -x
. $SCRIPT "$@"