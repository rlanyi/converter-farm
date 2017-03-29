log_level = "DEBUG"
data_dir = "/tmp/nomad"
bind_addr = "0.0.0.0"

region = "eu"

# be sure to change the datacenter for your different nodes
datacenter = "ams2"

# this lets the server gracefully leave after a SIGTERM
leave_on_terminate = true

# again, double check that you insert your correct IP address!
advertise {
  http = "192.168.1.169:4646"
  rpc = "192.168.1.169:4647"
  serf = "192.168.1.169:4648"
}

server {
  enabled = true

  # we are now setting up a 3-node cluster
  bootstrap_expect = 1
}

# these settings allow Nomad to automatically find its peers through Consul
consul {
  server_service_name = "nomad"
  server_auto_join = true
  client_service_name = "nomad-client"
  client_auto_join = true
  auto_advertise = true
}

