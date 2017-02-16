#!/bin/sh
FLAGS=${FLAGS:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=couchdb.$NETWORK

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS \
	--net $NETWORK \
	-h $NAME \
	-v "$(pwd)/couchdb_data:/usr/local/var/lib/couchdb:rw" \
	--name $NAME \
	2600hz/couchdb
