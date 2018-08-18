# Deploy docker with nomad,consul,vault on Mac standalone

One node for lead and client, 3 clients just as examples to submit one of them

setup: add nomad,consul,vault to /usr/local/bin PATH

1. start consul(1.2.2) :consul agent -dev
2. start nomad(0.8.4)  :nomad agent -config server.hcl
3. start nomad agent   :
      nomad agent -config client1.hcl -network-interface=lo0
      
      nomad agent -config client2.hcl -network-interface=lo0
      
      nomad agent -config client3.hcl -network-interface=lo0
4. submit job          :nomad run ncv.hcl
5. verify by docker    :docker ps
6. verify by http .    : http://localhost:8090/ServletTest-1/hello
7. since v1.2 use consul-template, nomad use --add-host to stick to docker container



