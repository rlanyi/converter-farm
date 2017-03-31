#!/bin/bash

sudo apt-get -y install unzip nano mc net-tools telnet libcgroup1
curl -O http://192.168.1.147/hashicorp/consul_0.7.5_linux_amd64.zip
curl -O http://192.168.1.147/hashicorp/nomad_0.5.5_linux_amd64.zip
sudo unzip consul_0.7.5_linux_amd64.zip -d /usr/local/bin
sudo unzip nomad_0.5.5_linux_amd64.zip -d /usr/local/bin

sudo apt-get clean

consul version
nomad version
