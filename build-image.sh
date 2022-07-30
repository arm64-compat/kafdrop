#!/bin/bash -x

source ./set-env.sh

$MVN clean integration-test package docker:build -Ddocker.pull.registry=docker.io $@
$MVN docker:tag -Ddocker.image.tag=$DOCKER_TAG -Ddocker.image.repo=$DOCKER_REGISTRY/$DOCKER_REPOSITORY

docker push $DOCKER_REGISTRY/$DOCKER_REPOSITORY/$ARTIFACT_ID:$DOCKER_TAG
