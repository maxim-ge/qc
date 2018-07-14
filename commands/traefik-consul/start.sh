#
# Problems
#
tf=traefik
invoke ssh sudo 1 "pkill $tf" || echo Already killed
invoke ssh sudo 1 "./$tf --logLevel=DEBUG --debug -c traefik.toml"
