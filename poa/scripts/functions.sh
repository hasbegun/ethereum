#!/usr/bin/env ash

function prepareDatadir {
  datadir=$1

  if [ ! -d $datadir/geth ]; then
    echo "----------> A new data directory will be created: $datadir"
    geth --datadir $datadir init /opt/config/genesis.json

        #  --etherbase $etherbase \
        #  --networkid "18021982" \
        #  --gasprice "1" \
        #  --targetgaslimit "0x59a5380" \
  fi
}
