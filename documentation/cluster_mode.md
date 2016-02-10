# Cluster Mode Installation Options

There are three options for installating TestDoubles in cluster mode: pm2, docker, and vagrant.
PM2 is for running multiple instances of the application directly on the machine (not inside any container or VM).
Docker is for running TestDoubles in cluster mode, inside docker.
Vagrant is for running TestDoubles in cluster mode, inside Vagrant.

## PM2

To run TestDoubles in a cluster mode using PM2, first ensure that PM2 is installed.

```
npm install pm2 -g
```

Next, start PM2 with the pm2_td.json file. This starts TestDoubles on its own, and does not start Mountebank.

```
pm2 start pm2_td.json
```

Now, start Mountebank.

```
./node_modules/mountebank/bin/mb
```

The pm2_td.json configuration file contains the commands for environment variables and other options. The current configuration 
starts three instances of TestDoubles, but this can be changed.

## HAProxy-Consul

brew install consul
brew install haproxy

When running in cluster mode TestDoubles provides service discovery using Consul and a load balancer using HAProxy that link up and dynamically sync.

To run the following you need to first start Consul Service.
This can be done by running the following commands from your TestDoubles folder

```
consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -config-dir haproxy-consul/consul.d
```

Now run your TestDoubles server

```
./bin/tdctl
```

Next run the Consul-Template to start the HAProxy

```
consul-template -config=haproxy-consul/haproxy.json
```

Now navigate to your address using port number 7060. This can be changed in the haproxy.ctmpl located in the haproxy-consul folder in your TestDoubles folder.