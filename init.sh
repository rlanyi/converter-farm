#!/bin/bash

echo A38 Converter Farm --- Starting deploy scripts
sudo apt-get install unzip nano
curl -O https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip
curl -O https://releases.hashicorp.com/nomad/0.5.5/nomad_0.5.5_linux_amd64.zip
sudo unzip consul_0.7.5_linux_amd64.zip -d /usr/local/bin
sudo unzip nomad_0.5.5_linux_amd64.zip -d /usr/local/bin

sudo apt-get clean

consul version
nomad version
