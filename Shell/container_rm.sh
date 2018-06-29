#!/bin/bash
port=9000
while [ $port -lt 9003 ]
do
  docker stop vatic_$port
  docker rm vatic_$port
  echo "container vatic_$port removed."
  port=$(($port + 1)) # same as 'expr $port + 1'