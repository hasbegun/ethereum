#!/usr/bin/env ash
source /opt/scripts/functions.sh

DATADIR=/opt/ethereum

for keydir in /opt/accounts/* ; do
  if [[ $keydir != "/opt/accounts/keystore" ]]; then
     ACCT_PUB_KEY=$(cat $keydir 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
     echo $ACCT_PUB_KEY
     ADDRESSES=$ACCT_PUB_KEY,
  fi
done

ADDRESSES=${ADDRESSES%,}
echo $ADDRESSES

mkdir -p $DATADIR/keystore
cp -R /opt/config/accounts/keystore $DATADIR
prepareDatadir $DATADIR

NETRESTRICT=$(cat /opt/config/netrestrict)
NETWORKID=$(cat /opt/config/networkid)

#FIXME: getbootnodeurl need to speicify the bootnode name.
# BOOTNODE_URL=${BOOTNODE_URL:-$(/opt/scripts/getbootnodeurl.sh)}
# bootnode ip in docker compose:172.16.254.2
BOOTNODE_URL=enode://41a1558627f9d752e40a99c9245399fc76c52ba55b808f51ccda16b5b60196a420e6da709a38fb34a90c6f8fe6bd406deb999ba18d51ecdcf57e94bc31c28c04@eth-bootnode:30303

echo "Netrestrict: $NETRESTRICT"
echo "Network ID: $NETWORKID"
echo "Bootnode URL: $BOOTNODE_URL"

geth --datadir=$DATADIR \
     --bootnodes="$BOOTNODE_URL" \
     --networkid=$NETWORKID \
     --netrestrict=$NETRESTRICT \
     --nat extip:`hostname -i` \
     --http --http.addr="0.0.0.0" \
     --http.api="eth,web3,net,admin,personal,debug,net,miner,txpool,clique" \
     --http.corsdomain="*" \
     --unlock=$ADDRESSES \
     --password=/opt/config/master-password \
     --verbosity 3


