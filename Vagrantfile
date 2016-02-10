# -*- mode: ruby -*-
# vi: set ft=ruby :
# Maintainer: Rajesh Raheja
# November 2015


  $script = <<-SCRIPT
    sudo apt-get update
    sudo apt-get install -y nodejs npm wget curl unzip
    sudo rm -rf /var/lib/apt/lists/*
    sudo ln -s /usr/bin/nodejs /usr/bin/node
    sudo npm install -g npm
    export TD_USER=td
    export TD_ROOT=/opt/testdoubles
    export TD_HOME=${TD_ROOT}/node_modules/testdoubles
    export TD_HOST=http://localhost:5050
    export TD_PORT=5050
    export PATH=${TD_HOME}/bin:$PATH

    echo "export TD_USER=td" > /home/vagrant/.bash_aliases
    echo "export TD_ROOT=/opt/testdoubles" >> /home/vagrant/.bash_aliases
    echo "export TD_HOME=${TD_ROOT}/node_modules/testdoubles" >> /home/vagrant/.bash_aliases
    echo "export TD_HOST=http://localhost:5050"  >> /home/vagrant/.bash_aliases
    echo "export TD_PORT=5050"  >> /home/vagrant/.bash_aliases
    echo "export PATH=${TD_HOME}/bin:$PATH"  >> /home/vagrant/.bash_aliases
   
    echo Fetching Consul...
    cd /tmp/
    wget https://releases.hashicorp.com/consul/0.6.1/consul_0.6.1_linux_amd64.zip - O consul.zip
    echo Installing Consul...
    unzip consul_0.6.1_linux_amd64.zip
    sudo chmod +x consul
    sudo mv consul /usr/bin/consul
    sudo mkdir /etc/consul.d
    sudo chmod a+w /etc/consul.d

    rm -rf ${TD_ROOT} 
    mkdir -p ${TD_HOME}/testdoubles
    mkdir -p ${TD_HOME}/logs
    # cp -R /vagrant/* ${TD_HOME}
    sudo groupadd -r ${TD_USER}
    sudo useradd -r -m -g ${TD_USER} ${TD_USER}
    sudo chown -R ${TD_USER} ${TD_ROOT}
    sudo chgrp -R ${TD_USER} ${TD_ROOT}
    chmod 777 ${TD_HOME}/testdoubles
    chmod 777 ${TD_HOME}/logs
    cd ${TD_ROOT}
    npm install testdoubles --production
    cd ${TD_HOME}
    tdctl start

  SCRIPT

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", type: "dhcp"
  
      

config.vm.provision "shell", inline: $script

  config.vm.define "n2" do |n2|
      n2.vm.hostname = "n2"


  end
end