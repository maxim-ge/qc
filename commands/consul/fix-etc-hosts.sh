invoke ssh command 1 "sudo printf \"192.168.99.10\tnode1of3\n\" | sudo tee -a /etc/hosts"
invoke ssh command 1 "sudo printf \"192.168.99.11\tnode2of3\n\" | sudo tee -a /etc/hosts"
invoke ssh command 1 "sudo printf \"192.168.99.12\tnode3of3\n\" | sudo tee -a /etc/hosts"