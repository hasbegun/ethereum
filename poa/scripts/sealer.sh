#!/usr/bin/env ash
source /opt/scripts/functions.sh

DATADIR=/opt/ethereum
ETHERBASE=$1

mkdir -p $DATADIR/keystore
cp /opt/config/accounts/keystore/* $DATADIR/keystore
prepareDatadir $DATADIR

NETRESTRICT=$(cat /opt/config/netrestrict)
NETWORKID=$(cat /opt/config/networkid)
# BOOTNODE_URL=${BOOTNODE_URL:-$(/opt/scripts/getbootnodeurl.sh)}
BOOTNODE_URL=enode://41a1558627f9d752e40a99c9245399fc76c52ba55b808f51ccda16b5b60196a420e6da709a38fb34a90c6f8fe6bd406deb999ba18d51ecdcf57e94bc31c28c04@eth-bootnode:30303

echo "Netrestrict: $NETRESTRICT"
echo "Network ID: $NETWORKID"
echo "Boonode URL: $BOOTNODE_URL"
echo "Etherbase: $ETHERBASE"

geth --datadir=$DATADIR \
     --bootnodes="$BOOTNODE_URL" \
     --networkid=$NETWORKID \
     --netrestrict=$NETRESTRICT \
     --nat extip:`hostname -i` \
     --mine \
     --miner.etherbase=$ETHERBASE \
     --miner.gasprice="1" \
     --unlock=$ETHERBASE \
     --password=/opt/config/master-password \
     --verbosity 3

