job "ncv" {
 
  region = "global"

  
  datacenters = ["dc1"]


  type = "service"

  # Specify this job to have rolling updates, two-at-a-time, with
  # 30 second intervals.
  update {
    stagger      = "5s"
    max_parallel = 1
  }

  # A group defines a series of tasks that should be co-located
  # on the same client (host). All tasks within a group will be
  # placed on the same host.
  group "webs" {
    # Specify the number of these tasks we want.
    count = 1

    # Create an individual task (unit of work). This particular
    # task utilizes a Docker container to front a web application.
    task "hellosky" {
      # Specify the driver to be "docker". Nomad supports
      # multiple drivers.
      driver = "docker"
	  artifact {
		    source = "http://172.29.144.1:8000/ncv_app1.1.tar"
	  }
	  
      # Configuration is specific to each driver.
      config {
        image = "skyscreen/ncv:app1.1"
		#block dockerhub
		#force_pull = false		
		
		load = "ncv_app1.1.tar"
		
        command = "/tmp/servlet/start.sh"
		#args = ["-v","/tmp:/mnt/c/tmp"]
		#volumes = [
		#   "/mnt/c/tmp:/tmp"
		#]
        #dns_servers = ["192.168.1.1", "8.8.8.8"]
				port_map {
							http = 8080
				}        
      }
	  

	  

      # The service block tells Nomad how to register this service
      # with Consul for service discovery and monitoring.
      service {
        # This tells Consul to monitor the service on the port
        # labelled "http". Since Nomad allocates high dynamic port
        # numbers, we use labels to refer to them.
        port = "http"
        check {
          name     = "ncvalive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }

      }

      # It is possible to set environment variables which will be
      # available to the task when it runs.
      env {
        #"DB_HOST" = "db01.example.com"
        #"DB_USER" = "web"
        #"DB_PASS" = "loremipsum"
      }

      # Specify the maximum resources required to run the task,
      # include CPU, memory, and bandwidth.
      resources {
        cpu    = 500 # MHz
        memory = 128 # MB

        network {
          mbits = 100

          # This requests a dynamic port named "http". This will
          # be something like "46283", but we refer to it via the
          # label "http".
          port "http" {
            static = 8090
            #netmask = "192.168.1.0/32"
          }

          # This requests a static port on 443 on the host. This
          # will restrict this task to running once per host, since
          # there is only one port 443 on each host.
          port "https" {
            #static = 443
          }
        }
      }
    }
  }
}
