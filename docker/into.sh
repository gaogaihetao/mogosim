#!/usr/bin/env bash

source $( dirname ${BASH_SOURCE[0]} )/common.sh

docker exec -it ${DOCKER_NAME} /bin/bash