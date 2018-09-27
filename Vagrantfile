Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu18_box"
  config.vm.network "forwarded_port", guest: 22, host: 2222
  config.vm.network "forwarded_port", guest: 8080, host: 2080
  config.vm.network "forwarded_port", guest: 4646, host: 4646
  config.vm.network "forwarded_port", guest: 1500, host: 1500
  config.vm.network "forwarded_port", guest: 2080, host: 3080
  config.vm.synced_folder "tmp1/", "/tmp2"
  
  config.vm.provider :virualbox do |vb|
	vb.memory = 2048
	vb.cpus = 2
  end
  config.ssh.username = "sky"
  config.ssh.password = "sky"
  config.vm.provision "shell", inline: <<-SCRIPT
    cd  /home/sky/ncv/deploy/
	"/home/sky/ncv/deploy/tf_start_all.sh"
  SCRIPT	
  
  config.vm.provision "shell", inline: <<-SCRIPT
	echo "Vagrant Box provisioned"
	echo "Please sart MiniWeb to start nomad & docker"
	echo "Access by http://localhost:8080"
  SCRIPT
end