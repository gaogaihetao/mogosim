#!/usr/bin/env bash

source $( dirname ${BASH_SOURCE[0]} )/common.sh

CODE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd -P )"

# container
WORKSPACE=/mogusim/

# stop the container if it's already running
RUNNING=$(docker ps --format "{{.Names}}" | grep ${DOCKER_NAME})
if [ ! -z ${RUNNING} ]; then
  if docker stop ${DOCKER_NAME}; then
    echo "${DOCKER_NAME} is stopped"
  else
    echo "failed to stop ${DOCKER_NAME}"
    exit -1
  fi
fi

# run container
# mount code directory
docker run -itd --rm --name ${DOCKER_NAME} \
-v ${CODE_DIR}:${WORKSPACE} \
${IMAGE_NAME} /bin/bash > /dev/null

# setup ros and build codes
docker exec ${DOCKER_NAME} \
    bash -c "source /opt/ros/rolling/setup.bash \
    && colcon build"
