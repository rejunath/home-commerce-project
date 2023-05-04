#!/bin/sh
list=$(docker images | grep v1 | cut -d " " -f1)
for i in $list
do
  echo "docker tagging for $i"
  docker tag $i:v1 rejuaws/$i:v1
done

newlist==$(docker images | grep v1 | grep rejuaws | cut -d " " -f1)
for i in $newlist
do
  echo "$i image pushed to docker"
  docker push $i:v1
done

