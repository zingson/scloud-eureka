#!/bin/sh

NAME=$1
VERSION=$2
FULL_NAME="$1-$2.jar"
MV_URL=$3

DURL=http://10.18.222.8/docker

D_RM="docker service rm $NAME"
echo "$D_RM"
curl -H "Content-Type: text/plain" -d "$D_RM" -X POST -s $DURL

DOCKER_CMD="docker service create --name $NAME \
--label group=io.ms.scloud \
--label name=$NAME \
--label version=$VERSION \
--network cluster \
-p 39111:39111 \
--replicas 2 \
-d openjdk:8-jre-alpine sh -c \
'wget $MV_URL/io/ms/scloud/$NAME/$VERSION/$FULL_NAME &&java -jar $FULL_NAME --spring.profiles.active=dev'"
echo "><br>"
echo ">$DOCKER_CMD"
curl -s -H "Content-Type: text/plain" -d "$DOCKER_CMD" -X POST -s $DURL

echo ">Deploy finish . ^_^ . ^_^ ."

