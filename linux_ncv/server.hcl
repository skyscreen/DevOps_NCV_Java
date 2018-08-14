
# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server1"


advertise {
	rpc = "127.0.0.1:4647"
	serf = "127.0.0.1:4648"
}

# Enable the server
server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}

