invoke ssh command 1 "\
sudo docker run\
  -d\
  -p 8877:8080\
  --name=cadvisor\
  -v /:/rootfs:ro\
  -v /var/run:/var/run:rw\
  -v /sys:/sys:ro\
  -v /var/lib/docker/:/var/lib/docker:ro\
  google/cadvisor\
"
