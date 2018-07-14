Installs consul as a normal (not docker) program

- Install and run cluster: `cluster consul`
- Create periodical on all nodes: `cluster consul create-periodicals`
- Enable periodicals : `cs 1 consul_dir/consul kv put periodical run`
- Start periodical on particular node : `start cs 1 sh consul_dir/periodical-start.sh`
- Disable periodicals : `cs 1 consul_dir/consul kv put periodical stop`