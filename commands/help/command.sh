FILE=$COMMAND_HOME/help
if [ ! -z $1 ]; then
  FILE2=$COMMANDS_HOME/$1/help
  if [ -f $FILE2 ]; then
    FILE=$FILE2
  fi
fi

echo
cat $FILE | invoke utils current-os-eols

