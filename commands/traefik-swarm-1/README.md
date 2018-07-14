Signle instance of traefik in swarm mode

- `traefik.backend.loadbalancer.stickiness=true` works only if `curl -c c.txt -b c.txt...` is used
- whoami1: curl -v -H Host:swarm-ip swarm-ip:80
- whoami1: curl -v swarm-ip:80
- whoami2: curl -v swarm-ip:82

traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Configuration received from provider docker: {"backends":{"backend-whoami":{"servers":{"server-whoami-1":{"url":"http://10.0.0.8:80","weight":0},"server-whoami-2":{"url":"http://10.0.0.6:80","weight":0}},"loadBalancer":{"method":"wrr","stickiness":{}}}},"frontends":{"frontend-Host-whoami-tr-0":{"entryPoints":["http"],"backend":"backend-whoami","routes":{"route-frontend-Host-whoami-tr-0":{"rule":"Host:whoami.tr"}},"passHostHeader":true,"priority":0,"basicAuth":[],"headers":{}}}}" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Last docker config received more than 2s, OK" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Creating frontend frontend-Host-whoami-tr-0" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Wiring frontend frontend-Host-whoami-tr-0 to entryPoint http" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Creating route route-frontend-Host-whoami-tr-0 Host:whoami.tr" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Creating backend backend-whoami" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Creating load-balancer wrr" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Sticky session with cookie _e75b7" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Creating server server-whoami-1 at http://10.0.0.8:80 with weight 0" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=debug msg="Creating server server-whoami-2 at http://10.0.0.6:80 with weight 0" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:44Z" level=info msg="Server configuration reloaded on :80" 
traefik.1.pmmhvg2p1das@node1of3    | time="2018-01-16T09:52:49Z" level=warning msg="Error forwarding to http://10.0.0.7:80, err: dial tcp 10.0.0.7:80: getsockopt: no route to host" 