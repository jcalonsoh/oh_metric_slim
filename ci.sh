#!/usr/bin/env bash

docker-machine create oh-metricslim -d virtualbox

docker-machine start oh-metricslim

docker-machine env oh-metricslim

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://$(docker-machine ip oh-metricslim):2376"
export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

eval "$(docker-machine env oh-metricslim)"

echo "Docker Machine:: List Containers: stop & remove"
docker ps -a -q
sleep 5

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker build --build-arg=RUBY_VERSION=$(rbenv version | cut -d "(" -f1) --file=Dockerfile.centos -t ohmetricslim --rm=true .
docker run -t -i -d ohmetricslim
docker exec -t -i $(docker ps | grep ohmetricslim | head | cut -d " " -f1) bundle exec oh-metricslim cpu
