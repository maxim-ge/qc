[ -n "$1" ] || { echo Node must be supplied ; exit 1;}
[ -n "$2" ] || { echo PID must be supplied; exit 1; }

list=$(invoke ssh ps-childs $1 $2)
for i in $list
do
	invoke ssh command $1 kill $i || echo Failed to kill $i
done
invoke ssh command $1 kill $2