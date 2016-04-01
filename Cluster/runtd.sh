#!/bin/bash

nohup tdctl start-server &

while :; do
  sleep 300
done