#log_level = "DEBUG"
data_dir = "/tmp/nomad"

region = "eu"

# be sure to change the datacenter for your different nodes
datacenter = "a38"

#advertise {
#  http = "<IP>:4646"
#  rpc = "<IP>:4647"
#  serf = "<IP>:4648"
#}

client {
  enabled = true
}

leave_on_terminate = true
consul {
  address = "192.168.1.10:8500"
  server_service_name = "nomad"
  server_auto_join = true
  client_service_name = "nomad-client"
  client_auto_join = true
  auto_advertise = true
}

