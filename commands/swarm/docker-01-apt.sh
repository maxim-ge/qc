# update repo
#sudo apt-get update

# remove previous
#sudo apt-get remove docker docker-engine docker.io

# install deps
sudo apt-get install -y -q\
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key:
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo for amd64
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update package index
sudo apt-get update
