#!/bin/bash
docker ps 
docker network ls
curl -X GET http://myapi:3000/appointment/list_details/
set -e

sleep 2s

# Waits for the application to be responsive.
# We could do a more thorough healthcheck once more
# is know/specified about what being 'ready' means.
docker container \
  run \
  --network demo \
  --rm \
  docker.io/jwilder/dockerize \
  -wait tcp://localhost:3000 \
  -wait-retry-interval 2s \
  -timeout 20s \

# Once the container is ready, we need to wait a bit more
# TODO: Replace this with some real wait command, since our mock
# application is returning 502s in the beginning
sleep 2s

mkdir -p test-data-volume

docker-compose up --build
docker ps
docker network inspect demo
curl -X GET http://myapi:3000/appointment/list_details/
mkdir -p ./result
cp ./test_data/results.json ./result/example_result.message
