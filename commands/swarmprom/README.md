Installs swarmprom, since stack deploy ignores environment variables, docker-compose.yml is modified by sed directly

# Problems

- https://github.com/moby/moby/issues/30251
  - docker stack deploy ignores environment variables and replaces them with blank values
- https://github.com/docker/for-linux/issues/114

# Misc 
scopy commands\swarmprom\.swarmprom\docker-compose.yml  /home/cluster/swarmprom/docker-compose.yml

- https://chmod666.org/2017/08/monitoring-a-docker-swarm-cluster-with-prometheus
- https://docs.docker.com/compose/compose-file/
- https://untillpro.slack.com/apps/manage/custom-integrations
- https://api.slack.com/apps
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04
- https://www.nginx.com/blog/free-certificates-lets-encrypt-and-nginx/