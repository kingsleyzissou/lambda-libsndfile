#!/bin/bash -x

set -e

rm -rf layer
docker build -t py37-libsndfile-builder .
CONTAINER=$(docker run -d py37-libsndfile-builder false)
docker cp $CONTAINER:/opt layer
docker rm $CONTAINER
