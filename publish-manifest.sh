#!/bin/bash -x

source ./set-env.sh

DOCKER_IMAGE=$DOCKER_REGISTRY/$DOCKER_REPOSITORY/$ARTIFACT_ID

MANIFEST_NAME=$DOCKER_IMAGE:$KAFDROP_VERSION
ARM_IMAGE=$MANIFEST_NAME-arm64
AMD_IMAGE=$MANIFEST_NAME-amd64

docker manifest create $MANIFEST_NAME $ARM_IMAGE $AMD_IMAGE
docker manifest push $MANIFEST_NAME
