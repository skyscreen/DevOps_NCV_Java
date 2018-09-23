#!/bin/sh



sudo chmod +x /home/sky/ncv/deploy/*.sh 
sudo chmod +r /home/sky/ncv/deploy/*.hcl 

if ! pgrep -x "consul" > /dev/null
then
    sh /home/sky/ncv/deploy/cserver.sh > /tmp/cserver.out 2>&1 &
fi


if ! pgrep -x "consul" > /dev/null
then
    sh /home/sky/ncv/deploy/nserver.sh > /tmp/nserver.out 2>&1 &
    sh /home/sky/ncv/deploy/nagent.sh > /tmp/nagent.out 2>&1 &

fi


echo "start to run terraform nomad job"


#run module in path
#terraform destroy > /tmp/tf_destroy.out 2>&1 &
#terraform init > /tmp/tf_init.out 2>&1 &
#terraform apply > /tmp/tf_apply.out 2>&1

echo yes | terraform destroy &&
echo yes | terraform init &&
echo yes | terraform apply 
