#!/bin/sh

id=$(docker create "$1")

docker cp "$id:/home/build/packages/opt/x86_64" .
docker rm -v "$id"
