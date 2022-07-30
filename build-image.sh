#!/bin/bash -x

source ./set-env.sh

$MVN clean integration-test package docker:build $@
$MVN docker:tag -Ddocker.image.tag=$DOCKER_TAG -Ddocker.image.repo=$DOCKER_REGISTRY/$DOCKER_REPOSITORY
