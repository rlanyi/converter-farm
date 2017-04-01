#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

defaultInterface=$(sudo route | grep default | awk '{print $(NF)}')
defaultIP=$(sudo ifconfig $defaultInterface | grep 'inet addr:' | cut -d: -f2 |  awk '{ print $1}')
find $DIR -name "*.hcl" -type f -print0 | xargs -0 sed -i "s/<IP>/$defaultIP/g"

sudo screen -dm bash -c "while true; do nomad agent -config $DIR/nomad-client >>/var/log/nomad-client.log 2>&1 ; sleep 10 ; done"
