#!/bin/bash

port=9000
for dir in frames/*
do
  echo "mounting $port ======>"
  docker run -it -d -p $port:80 -v $PWD/$dir:/root/vatic/data --name "vatic_$port" vatic:1.4
  echo "init task ======>"
  docker exec -it "vatic_$port" sh -c "cd root/vatic && ./startup.sh && mkdir raw_images && cp -r data/* raw_images && turkic formatframes raw_images images/ && turkic load task images/ Face --length 2000 --overlap 0 --offline && turkic publish --offline && export list=raw_images/*.lst && python import_data.py \$list task"
  echo "create $port done."
  port=$(($port+1))
done