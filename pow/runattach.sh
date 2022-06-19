#!/bin/sh
NODE=$1
NODE=${NODE:-"ethereum-node1"}
DATADIR=/opt/ethereum

docker exec -ti "$NODE" geth --datadir $DATADIR attach
