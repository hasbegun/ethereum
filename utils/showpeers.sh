#!/bin/sh
NODE=$1
NODE=${NODE:-"node"}
CONTAINER_NAME="poa-eth-$NODE-1"
docker exec -ti "$CONTAINER_NAME" geth --datadir /opt/ethereum --exec 'admin.peers' attach
