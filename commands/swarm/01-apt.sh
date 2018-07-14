# Reinstall certs
# https://github.com/moby/moby/issues/23315
invoke ssh command $1 "sudo apt-get install --reinstall ca-certificates"

# Update repos

invoke ssh command $1 "sudo apt-get update"

# install deps

cmd="\
sudo apt-get install -y -q\
 apt-transport-https\
 ca-certificates\
 curl\
 software-properties-common\
"
invoke ssh command $1 "$cmd"

# Add Docker's official GPG key:

cmd="sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
invoke ssh command $1 "$cmd" 

# Add docker repo for amd64

cmd="\
sudo add-apt-repository\
 \"deb [arch=amd64] https://download.docker.com/linux/ubuntu\
 \$(lsb_release -cs)\
 stable\"\
"
invoke ssh command $1 "$cmd"

# Update repos
invoke ssh command $1 "sudo apt-get update"
