#!/bin/bash

# echo "$1"
port=8888
for file in frames/*
do
  echo $file
  port=$(($port+1))
  echo $port
done