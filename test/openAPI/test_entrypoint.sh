#!/bin/bash
docker ps 
docker network ls

set -e

sleep 2s

# Waits for the application to be responsive.
# We could do a more thorough healthcheck once more
# is know/specified about what being 'ready' means.
docker container \
  run \
  --network host \
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
# curl -X GET http://localhost:3000/entity/list_details/
docker-compose up --build
# docker exec pytest cat /etc/hosts
# docker ps 
# docker network ls
# docker ps 
# docker network inspect demo
# docker inspect pytest
# docker exec -i pytest pytest --cucumberjson=/data/results.json /tests
mkdir -p ./result
cp /data/results.json ./result/example_result.message
