#!/bin/bash
#
# Runs a bootnode with ethereum official "alltools" image.
#

IMGNAME="ethereum/client-go:alltools-v1.10.18"
DATA_ROOT=${DATA_ROOT:-$(pwd)/config}

echo "Generate new accounts."
mkdir -p $DATA_ROOT/accounts
for acct in account1 account2 account3 account4 account5
do
    if [ ! -f $DATA_ROOT/accounts/$acct ]; then
        echo "$DATA_ROOT/accounts/$acct not found, generating..."
        docker run --rm \
            -v $DATA_ROOT/master-password:/opt/config/master-password:ro \
            -v $DATA_ROOT/accounts:/opt/config/accounts:rw \
            $IMGNAME geth account new --password /opt/config/master-password --datadir /opt/config/accounts >> $DATA_ROOT/accounts/$acct
        echo
        echo "$acct generated."
    fi

    ACCT_PUB_KEY=$(cat $DATA_ROOT/accounts/$acct 2>&1 | grep "key:" | awk 'END {print $6}')
    mv $DATA_ROOT/accounts/$acct $DATA_ROOT/accounts/$ACCT_PUB_KEY
    echo "$acct : $ACCT_PUB_KEY"
done
