invoke ssh command 1 "\
sudo docker run --name ne -d -p 9100:9100 -v \"/proc:/host/proc\" -v \"/sys:/host/sys\" -v \"/:/rootfs\" prom/node-exporter --path.procfs /host/proc --path.sysfs /host/proc\
 --collector.filesystem.ignored-mount-points \"^(/rootfs|/host|)/(sys|proc|dev|host|etc)(\$\$|/)\"\
 --collector.filesystem.ignored-fs-types     \"^(sys|proc|auto|cgroup|devpts|ns|au|fuse\.lxc|mqueue)(fs|)\$\$\"\
"

#invoke ssh command 1 "\
#sudo docker run --name ne -d -p 9100:9100 -v \"/proc:/host/proc\" -v \"/sys:/host/sys\" -v \"/:/rootfs\" --net=\"host\" prom/node-exporter --path.procfs /host/proc --path.sysfs /host/proc --collector.filesystem.ignored-mount-points \"^/(sys|proc|dev|host|etc)($|/)\" \
#"
