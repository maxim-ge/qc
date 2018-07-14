# Docker Commands

- docker logs prom1
- docker logs ne

- reload prometheus config: curl -s -XPOST localhost:9090/-/reload
- prometheus: http://swarm-ip:9090/targets
- cadvisor metrics: http://swarm-ip:8090/metrics
- !!! cadvisor http://192.168.99.10:8877/containers/

# Links

- Good working version: https://github.com/vegasbrianc/prometheus/issues/63
- https://github.com/prometheus/node_exporter/issues/66
- https://www.digitalocean.com/community/tutorials/how-to-install-prometheus-using-docker-on-ubuntu-14-04

Further

- https://medium.com/@soumyadipde/monitoring-in-docker-stacks-its-that-easy-with-prometheus-5d71c1042443
- https://grafana.com/dashboards/893
- https://github.com/vegasbrianc/prometheus

### Problems

- https://community.grafana.com/t/dashboard-api-unprocessable-entity/4628
  - https://github.com/grafana/grafana/issues/7592
- https://github.com/vegasbrianc/prometheus/issues/63 