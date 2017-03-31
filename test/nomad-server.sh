#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo sh -c "nomad agent -config $DIR/nomad-server >>/var/log/messages 2>&1 &"
