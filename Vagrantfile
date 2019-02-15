# -*- mode: ruby -*-
# vi: set ft=ruby :

$script1 = <<SCRIPT
sudo sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo echo 'root:pas' | sudo chpasswd
sudo service ssh restart
SCRIPT

Vagrant.configure("2") do |config|

#  config.vm.box = "ubuntu/trusty64"
  config.vm.box = "bento/ubuntu-18.10"

  (1..3).each do |i|
    nname = "node#{i}"
    config.vm.define "#{nname}" do |node|                       
      config.vm.provision "shell", inline: $script1          
      node.vm.hostname = "#{nname}" #host name
      node.vm.network "private_network", ip: "192.168.99.#{10+i-1}"
    	node.vm.provider :virtualbox do |vb|                   
        vb.name = "#{nname}" #virtual box machine name          
        vb.memory = "2028"                                   
      end                                                    
    end                                                      
  end


end
