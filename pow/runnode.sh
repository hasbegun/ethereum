#!/bin/bash

IMGNAME="ethereum/client-go:latest"
# IMGNAME="ethereum/client-go:alltools-v1.10.18"
DOCKER_ETH_NETWORK=ethereum
NODE_NAME=$1
NODE_NAME=${NODE_NAME:-"node1"}
DETACH_FLAG=${DETACH_FLAG:-"-d"}
CONTAINER_NAME="ethereum-$NODE_NAME"
DATA_ROOT=${DATA_ROOT:-"$(pwd)/.ether-$NODE_NAME"}
DATA_HASH=${DATA_HASH:-"$(pwd)/.ethash"}

echo "Destroying old container $CONTAINER_NAME..."
docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME

RPC_PORTMAP=
RPC_ARG=
if [[ ! -z $RPC_PORT ]]; then
    # RPC_ARG='--ws --wsaddr=0.0.0.0 --wsport 8546 --wsapi=db,eth,net,web3,personal --wsorigins "*" --rpc --rpcaddr=0.0.0.0 --rpcport 8545 --rpcapi=db,eth,net,web3,personal --rpccorsdomain "*"'
    # RPC_ARG='--rpc --rpcaddr=0.0.0.0 --rpcport 8545 --rpcapi=db,eth,net,web3,personal --rpccorsdomain "*"'
    RPC_ARG='--networkid 1981 --allow-insecure-unlock --http --http.port 8545 --http.addr 0.0.0.0 --http.api eth,web3,net,admin,personal --http.corsdomain="*"'
    # RPC_PORTMAP="-p $RPC_PORT:8545"
fi

echo "RPC args: $RPC_ARG"
echo "RPC port map: $RPC_PORTMAP"

BOOTNODE_URL=${BOOTNODE_URL:-$(./getbootnodeurl.sh)}
echo "Bootnode url: $BOOTNODE_URL"

echo "Look for the genesis.json."
if [ ! -f $(pwd)/genesis.json ]; then
    echo "No genesis.json file found, please run 'genesis.sh'. Aborting."
    exit
fi

echo "look for keystore at $DATA_ROOT..."
if [ ! -d $DATA_ROOT/keystore ]; then
    echo "$DATA_ROOT/keystore not found, running 'geth init'..."
    docker run --rm \
        -v $DATA_ROOT:/root/.ethereum \
        -v $(pwd)/genesis.json:/opt/genesis.json \
        $IMGNAME init /opt/genesis.json
    echo && echo "Genesis init done!"
fi

echo "Running new container $CONTAINER_NAME ..."
docker run $DETACH_FLAG --name $CONTAINER_NAME \
    --network $DOCKER_ETH_NETWORK \
    -v $DATA_ROOT:/root/.ethereum \
    -v $DATA_HASH:/root/.ethash \
    -v $(pwd)/genesis.json:/opt/genesis.json \
    $IMGNAME --bootnodes=$BOOTNODE_URL $RPC_ARG --cache=512 --verbosity=6 --maxpeers=5 ${@:2}
