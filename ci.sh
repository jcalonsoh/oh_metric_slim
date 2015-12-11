#!/usr/bin/env bash

docker-machine start default

docker-machine env default

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jalonso/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

eval "$(docker-machine env default)"

echo "Docker Machine List stop & remove"
docker ps -a -q
sleep 5

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
#docker rmi $(docker images -a -q)

docker build --build-arg=RUBY_VERSION=$(rbenv version | cut -d "(" -f1) --file=Dockerfile -t ohmetricslim --rm=true .
docker run -t -i -d ohmetricslim
docker exec -t -i oh-metricslim cpu
