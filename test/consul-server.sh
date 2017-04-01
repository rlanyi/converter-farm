#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo screen -dm bash -c "while true; do consul agent -config-dir $DIR/consul-server >>/var/log/consul-server.log 2>&1 ; sleep 10 ; done"
