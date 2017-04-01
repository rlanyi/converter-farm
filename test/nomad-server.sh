#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo screen -dm bash -c "while true; do nomad agent -config $DIR/nomad-server >>/var/log/nomad-server.log 2>&1 ; sleep 10 ; done"
