#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get -y install unzip nano mc net-tools telnet cron logrotate screen npm libcgroup1
sudo mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

curl -O http://192.168.1.147/hashicorp/consul_0.7.5_linux_amd64.zip
curl -O http://192.168.1.147/hashicorp/nomad_0.5.5_linux_amd64.zip
sudo unzip consul_0.7.5_linux_amd64.zip -d /usr/local/bin
sudo unzip nomad_0.5.5_linux_amd64.zip -d /usr/local/bin

rm *.zip
sudo apt-get clean

$DIR/test/nomad-client.sh

git clone https://github.com/yaronn/blessed-contrib.git
cd blessed-contrib
npm install
cd $DIR
nodejs blessed-contrib/examples/dashboard.js

read -p "Nyomj ENTER-t az ujrainditashoz!"
sudo reboot
