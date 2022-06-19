#!/bin/sh
NODE=$1
NODE=${NODE:-"node"}
DATADIR=/opt/ethereum
CONTAINER_NAME="poa-eth-$NODE-1"

docker exec -ti "$CONTAINER_NAME" geth --datadir $DATADIR --exec 'admin.peers.length' attach
