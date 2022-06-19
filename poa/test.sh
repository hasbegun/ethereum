#!/bin/bash

for keydir in ./config/accounts/* ; do
  if [[ $keydir != "./config/accounts/keystore" ]]; then
    echo ">> $keydir"
    ACCT_PUB_KEY=$(cat $keydir 2>&1 | grep "key:" | awk 'END {print $6}' | cut -c3-43)
    echo ">> $ACCT_PUB_KEY"
    ACC+=$ACCT_PUB_KEY,
  fi
done
ACC=${ACC%,}
echo $ACC

netid=$(cat ./config/networkid)
echo ">> netid: $netid"
