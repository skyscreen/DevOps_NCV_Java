#!/bin/sh

find /tmp ! -name 'deploy_job.yml' -type f -exec rm -f {} +
#sudo rm -rf /tmp/*

cd /home/sky/k8
cp deploy_job.yml /tmp
sh reset.sh
sh swap_init_1.sh > /tmp/swap1.out 2>&1 &&
sh cluster_2.sh > /tmp/cluster2.out 2>&1 &&
sh single_3.sh > /tmp/single3.out 2>&1 &&
echo "ready to run yml ......" &&
sleep 10 &&
sh start_4.sh > /tmp/start_4.out 2>&1 &&
sh forward_port_5.sh  &&
echo "kubernetes network starting ......"



