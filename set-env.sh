#!/bin/bash -x

export DOCKER_REGISTRY=${DOCKER_REGISTRY:=ghcr.io}
export DOCKER_REPOSITORY=${DOCKER_REPOSITORY:=arm64-compat}

BUILD_ARCH=$(uname -m)

case $BUILD_ARCH in
    
    "x86_64")
        BUILD_ARCH="amd64"
        ;;

    "aarch64")
        BUILD_ARCH="arm64"
        ;;

esac

export MVN="mvn -B"
export MVN_HELP="$MVN -q org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -DforceStdout=true"
export KAFDROP_VERSION=$(sh -c "$MVN_HELP -f pom.xml -Dexpression=project.version")
export ARTIFACT_ID=$(sh -c "$MVN_HELP -f pom.xml -Dexpression=project.artifactId")
export DOCKER_REPOSITORY=${DOCKER_REPOSITORY}/${ARTIFACT_ID}
export DOCKER_TAG="$KAFDROP_VERSION"

if [ "$CIRCLE_BRANCH" != "main" ]; then
  DOCKER_TAG="$DOCKER_TAG-edge"
fi

DOCKER_TAG="$DOCKER_TAG-$BUILD_ARCH"

echo "KAFDROP_VERSION=KAFDROP_VERSION"
echo "DOCKER_TAG=$DOCKER_TAG"

echo "MVN=$MVN"
