#!/bin/bash

# Variables
ENVIRONMENT=$1
DOCKER_IMAGE="tomcat_ansible_test:v3"
CONTAINER_NAME="tomcat_ansible_test_container-1"

usage() {
    echo "Usage: $0 <ENVIRONMENT>"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

echo ""
echo "Building Docker Image"
echo "---------------------"
docker build -t $DOCKER_IMAGE .

echo ""
echo "Running Docker Container"
echo "------------------------"
docker run -it  -d --privileged=true --name $CONTAINER_NAME    -v $(pwd)/deploy:/data   -p 8180:8180  $DOCKER_IMAGE  "/sbin/init"  
docker exec -it  $CONTAINER_NAME  bash -c "bash   /data/tomcat_test.sh $ENVIRONMENT"

echo ""
echo "Cleaning up Docker Container"
echo "----------------------------"
docker rm -f $CONTAINER_NAME
