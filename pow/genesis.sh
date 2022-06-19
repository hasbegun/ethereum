#!/bin/bash

GEN_NONCE="0xeddeadbabeeddead"
GEN_CHAIN_ID=1981
GEN_ALLOC='"0x0000000000000000000000000000000000000001": {"balance": "100000"}'
MODE=$1
if [[ $MODE == "poa" ]]; then
   TEMPLATE=src/genesis-poa.json.template
else
   TEMPLATE=src/genesis-poW.json.template
fi

sed "s/\${GEN_NONCE}/$GEN_NONCE/g" $TEMPLATE | sed "s/\${GEN_ALLOC}/$GEN_ALLOC/g" | sed "s/\${GEN_CHAIN_ID}/$GEN_CHAIN_ID/g" > genesis.json
