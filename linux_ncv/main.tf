
# Configure the Nomad provider
provider "nomad" {
  address = "http://127.0.0.1:4646"
  region  = "global"
}



# Register a job
resource "nomad_job" "service" {
  jobspec = "${file("${path.module}/ncv.hcl")}"
}


# Configure the Consul provider
provider "consul" {
  address    = "http://127.0.0.1:8500"
  datacenter = "dc1"
}


resource "consul_keys" "sky" {
  datacenter = "dc1"
  

  # Set the keyvalue of vault as a key
  key {
    name  = "keytest"
    path  = "sky/vault"
    value = "${var.key}"
	delete = true
  }
}

