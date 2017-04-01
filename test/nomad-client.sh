#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo screen -dm bash -c "while true; do nomad agent -config $DIR/nomad-client >>/var/log/nomad-client.log 2>&1 ; sleep 10 ; done"
