# List all child processes

[ -n "$1" ] || { echo Node must be supplied ; exit 1;}
[ -n "$2" ] || { echo PID must be supplied; exit 1; }

list_descendants ()
{
  local children=$(invoke ssh command $1 ps -o pid= --ppid "$2")

  for pid in $children
  do
    list_descendants $1 "$pid"
  done

  echo "$children"
}

list_descendants $1 $2