#!/bin/sh
NETWORK=${1:-"kazoo"}
NETWORKNAME=${2:-"kazoo"}
for CONTAINER in monster-ui kazoo rabbitmq freeswitch couchdb
do
	if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.$NETWORK)" = "true" ]
	then
		echo `bin/get-ip.sh $NETWORKNAME $CONTAINER.$NETWORK` $CONTAINER.$NETWORK
	fi
done
exit
