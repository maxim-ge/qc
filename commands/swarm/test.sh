cmd="\
set -e;
sudo ufw allow 22/tcp;\
sudo ufw allow 2376/tcp;\
sudo ufw allow 2377/tcp;\
sudo ufw allow 7946/tcp;\
sudo ufw allow 7946/udp;\
sudo ufw allowq 4789/udp;\
sudo ufw reload;\
"
doe invoke ssh command 1 "'$cmd'"