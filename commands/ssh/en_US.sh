#https://help.ubuntu.com/community/Locale
invoke ssh command $1 "echo 'LANG=\"en_US.UTF-8\"' | sudo tee /etc/default/locale > /dev/null"