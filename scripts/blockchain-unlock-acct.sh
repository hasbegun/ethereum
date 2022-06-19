echo "make sure hash value."
echo "Unlock account $1"

curl --location --request POST 'http://localhost:8545' \
--header 'Content-type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 6,
    "method": "personal_unlockAccount",
    "params": [
        "0xa02d3df2eb976cead15dfce8b54349d073bc65e9",
        "5uper53cr3t"
    ]
}'