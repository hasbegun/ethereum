echo "make sure hash"
echo "The address is ${1}"

curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0xa02d3df2eb976cead15dfce8b54349d073bc65e9",
        "latest"
    ]
}'
