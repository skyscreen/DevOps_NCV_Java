#!/bin/sh
sudo chmod +x /home/sky/ncv/deploy/*.sh 
sudo chmod +r /home/sky/ncv/deploy/*.hcl 
sh /home/sky/ncv/deploy/cserver.sh > /tmp/cserver.out 2>&1 &  
sh /home/sky/ncv/deploy/nserver.sh > /tmp/nserver.out 2>&1 &
sh /home/sky/ncv/deploy/nagent.sh > /tmp/nagent.out 2>&1 &
echo "start to run nomad job"
sleep 5
nomad run /home/sky/ncv/deploy/ncv.hcl
