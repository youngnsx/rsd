#/bin/bash

FQDN=harbor105.dps.tw
PROJECT=cwa
NAME=mqtt2mqtt
TAG=0.0.1

IMAGE_PATH=$FQDN/$PROJECT/$NAME:$TAG

# echo $IMAGE_PATH

docker build -t $IMAGE_PATH .

