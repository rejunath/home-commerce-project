#!/bin/sh
path=$PWD
echo $path
cd src
list=$(ls)
for i in $list
do
  echo "docker image build started for $i"
  cd $i
  docker build -t $i:v1 .
  sleep 1s
  cd $path/src
done
docker images | grep v1
