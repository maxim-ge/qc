#!/bin/bash
#
# This file is sent to a node
#

set -e
set -x

echo "Making sure that hostname can be resolved locally..."
cat /etc/hosts | grep $(hostname) >/dev/null || printf "127.0.0.1\t$(hostname)\n" >> /etc/hosts

echo "Creating user '$CUSER'..."
CUSER=$cluster_user
useradd -p `openssl passwd -1 pwd` -m $CUSER


echo "Giving sudo permissions to '$CUSER'..."
echo "$CUSER ALL=(ALL) NOPASSWD:ALL" > ${CUSER}_sudo
visudo -c -f  ${CUSER}_sudo
mv ${CUSER}_sudo  /etc/sudoers.d

echo "Configuring public key authentication for '$CUSER'..."
su - $CUSER -c "mkdir ~/.ssh"
su - $CUSER -c "chmod 700 ~/.ssh"
su - $CUSER -c "sudo cat /root/cluster_key.pub > .ssh/authorized_keys"
su - $CUSER -c "chmod 600 ~/.ssh/authorized_keys"

echo "Disabling PasswordAuthentication..."
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

echo "Configuring firewall for ssh..."
ufw allow OpenSSH
yes | ufw enable
ufw reload

echo "Restarting ssh service..."
service ssh restart
