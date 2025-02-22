#!/usr/bin/env bash

SCRIPTS_DIR=$( dirname ${BASH_SOURCE[0]} )

source ${SCRIPTS_DIR}/common.sh

docker build ${SCRIPTS_DIR} -t ${IMAGE_NAME} --no-cache
