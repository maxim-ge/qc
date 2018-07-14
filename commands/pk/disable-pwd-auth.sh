invoke ssh command $1 sudo sed -i "'s/#PasswordAuthentication yes/PasswordAuthentication no/g'" /etc/ssh/sshd_config
invoke ssh command $1 sudo service ssh restart