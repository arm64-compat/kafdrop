#!/bin/bash -x

source ./set-env.sh

docker push $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG
