#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo sh -c "consul agent -config-dir $DIR/consul-server >>/var/log/messages 2>&1 &"
