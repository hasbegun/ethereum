#!/bin/sh
#
# Runs a bootnode with ethereum official "alltools" image.
#

IMGNAME="ethereum/client-go:alltools-v1.10.18"
DOCKER_ETH_NETWORK=ethereum
DOCKER_ETH_BOOTNODE=eth-bootnode
DATA_ROOT=${DATA_ROOT:-$(pwd)/config}

docker stop $DOCKER_ETH_BOOTNODE && docker rm $DOCKER_ETH_BOOTNODE

echo "Generate booknode key."
# generate bootnode key if needed
mkdir -p $DATA_ROOT/bootnode
if [ ! -f $DATA_ROOT/bootnode/nodekey.key ]; then
    echo "$DATA_ROOT/bootnode/nodekey.key not found, generating..."
    docker run --rm \
        -v $DATA_ROOT/bootnode:/opt/bootnode:rw \
        $IMGNAME bootnode --genkey /opt/bootnode/nodekey.key
    echo
    echo "Bootnode key generated."

    docker run --rm \
        -v $DATA_ROOT/bootnode:/opt/bootnode:rw \
        $IMGNAME bootnode -nodekey /opt/bootnode/nodekey.key -writeaddress >> $DATA_ROOT/bootnode/nodehex.pub.key
    echo "Boonode hex pub key is generated."
fi

NODEKEY=`cat $DATA_ROOT/bootnode/nodekey.key`
NODEHEXKEY=`cat $DATA_ROOT/bootnode/nodehex.pub.key`
echo "Bootnode key is $NODEKEY"
echo "Bootnode hex pub key is $NODEHEXKEY"

# echo "Check ethereum network."
# # creates ethereum network
# if [ ! "$(docker network ls | grep $DOCKER_ETH_NETWORK)" ]; then
#     docker network create $DOCKER_ETH_NETWORK
#     echo "Docker network $DOCKER_ETH_NETWORK is created."
# fi

# echo "Check and run the bootnode service."
# if [[ -z $BOOTNODE_SERVICE ]]; then
#     BOOTNODE_SERVICE="127.0.0.1"
# fi
# echo "Bootnode Service is $BOOTNODE_SERVICE."

# echo "Run $DOCKER_ETH_BOOTNODE ..."
# docker run -d --name $DOCKER_ETH_BOOTNODE \
#     -v $DATA_ROOT/.bootnode:/opt/bootnode \
#     --network $DOCKER_ETH_NETWORK \
#     $IMGNAME \
#     bootnode --nodekey /opt/bootnode/nodekey.key --verbosity=3 "$@"
# # --addr "$BOOTNODE_SERVICE:30301" "$@"

# docker run -d --name $DOCKER_ETH_BOOTNODE \
#     -v $DATA_ROOT/.bootnode:/opt/bootnode \
#     --network $DOCKER_ETH_NETWORK \
#     $IMGNAME \
#     geth --nodekey /opt/bootnode/nodekey.key --networkid 1981 --verbosity=3 "$@"
