echo "make sure hash"
echo "The address is ${1}"

curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0xc0c492246c48f26f23e84bd2168c08caaae33a6a",
        "latest"
    ]
}'
