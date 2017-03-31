log_level = "DEBUG"
data_dir = "/tmp/nomad"

region = "eu"

# be sure to change the datacenter for your different nodes
datacenter = "ams2"

client {
  enabled = true
}

leave_on_terminate = true
consul {
  address = "192.168.1.169:8500"
  server_service_name = "nomad"
  server_auto_join = true
  client_service_name = "nomad-client"
  client_auto_join = true
  auto_advertise = true
}

