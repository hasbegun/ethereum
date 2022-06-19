#!/usr/bin/env ash
source /opt/scripts/functions.sh

CONFIG_DIR=/opt/config
DATADIR=/opt/ethereum

HEXKEY=$(cat $CONFIG_DIR/bootnode/nodekey.key)
NETWORKID=$(cat $CONFIG_DIR/networkid)
NETRESTRICT=$(cat $CONFIG_DIR/netrestrict)

prepareDatadir $DATADIR

echo "Data dir: $DATADIR"
echo "Nodehex key: $HEXKEY"
echo "Network ID: $NETWORKID"
echo "Netrestrict: $NETRESTRICT"

# geth --datadir $DATADIR --nodekeyhex $HEXKEY --networkid $NETWORKID --netrestrict $NETRESTRICT --verbosity 3
geth --datadir $DATADIR \
     --nodekeyhex $HEXKEY \
     --networkid $NETWORKID \
     --nat extip:`hostname -i` \
     --netrestrict=$NETRESTRICT \
     --verbosity 3
