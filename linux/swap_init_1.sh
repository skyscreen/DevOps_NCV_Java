# turn off swap
sudo swapoff -a
sudo rm -f /swapfile
#sudo vi /etc/fstab
sudo swapon --summary
cat /proc/swaps

# initialize kubernetes
IP_ADDR=$(ip addr show enp0s3 | grep -Po 'inet \K[\d.]+')
echo $IP_ADDR
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=${IP_ADDR} --kubernetes-version stable-1.11

