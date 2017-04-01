#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

defaultInterface=$(sudo route | grep default | awk '{print $(NF)}')
defaultIP=$(sudo ifconfig $defaultInterface | grep 'inet addr:' | cut -d: -f2 |  awk '{ print $1}')
find $DIR \( -name "*.hcl" -o -name "*.json" \) -type f -print0 | xargs -0 sed -i "s/<IP>/$defaultIP/g"
find $DIR \( -name "*.hcl" -o -name "*.json" \) -type f -print0 | xargs -0 sed -i "s/<HOSTNAME>/$(hostname)/g"

sudo screen -dm bash -c "while true; do consul agent -config-dir $DIR/consul-server >>/var/log/consul-server.log 2>&1 ; sleep 10 ; done"
