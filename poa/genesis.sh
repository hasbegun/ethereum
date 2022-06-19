#!/bin/bash
CONF_DIR=$(pwd)/config
ACCT_DIR=$CONF_DIR/accounts
# key length is 43. remove starting 0x
# CNT=1
# for keydir in config/accounts/* ; do
#   if [[ $keydir != "config/accounts/keystore" ]]; then
#      ACCT_PUB_KEY=$(cat $keydir 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
#      echo $ACCT_PUB_KEY $CNT
#      ACCT$CNT=$ACCT_PUB_KEY
#      let CNT=CNT+1
#   fi
# done

ACCT1_PUB_KEY=$(cat $ACCT_DIR/0x0d2B767809d5dd9a62CAD1DA22Ac9401147cC1f0 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
ACCT2_PUB_KEY=$(cat $ACCT_DIR/0x5e234a32186B1b366bb0bb6367425dDaf1b07a03 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
ACCT3_PUB_KEY=$(cat $ACCT_DIR/0x7CBDc8B07446C9517874b1fcBE6Efb1d2b6634d6 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
ACCT4_PUB_KEY=$(cat $ACCT_DIR/0x70D3908DBf2D4b16DDc3d0a957667F31A62aF857 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
ACCT5_PUB_KEY=$(cat $ACCT_DIR/0x8791b9bb0B8eFE4ef29A1e84002e052424B2c29B 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
echo $ACCT1_PUB_KEY
echo $ACCT2_PUB_KEY
echo $ACCT3_PUB_KEY
echo $ACCT4_PUB_KEY
echo $ACCT5_PUB_KEY

GEN_NONCE="0xeddeadbabeeddead"
GEN_CHAIN_ID=$(cat $CONF_DIR/networkid)
GEN_ALLOC='"0x0000000000000000000000000000000000000001": {"balance": "100000"}'
TEMPLATE=./genesis.json.template

sed "s/\${GEN_NONCE}/$GEN_NONCE/g" $TEMPLATE | sed "s/\${GEN_ALLOC}/$GEN_ALLOC/g" | sed "s/\${ACCT1}/$ACCT1_PUB_KEY/g" | sed "s/\${ACCT2}/$ACCT2_PUB_KEY/g" |sed "s/\${ACCT3}/$ACCT3_PUB_KEY/g" |sed "s/\${ACCT4}/$ACCT4_PUB_KEY/g" |sed "s/\${ACCT5}/$ACCT5_PUB_KEY/g" | sed "s/\${GEN_CHAIN_ID}/$GEN_CHAIN_ID/g" > $CONF_DIR/genesis.json
