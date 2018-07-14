if [ ! "$1" = "1" ]; then
	echo "$2" | grep "manager\|worker" > /dev/nul || die You should supply "'manager'" or "'worker'" role
fi

invoke swarm 01-apt $*
invoke swarm 10-ufw-manager $*
invoke swarm 30-install $*
invoke swarm 40-init-or-join $*
invoke swarm 50-metrics $*


