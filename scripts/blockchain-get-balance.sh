echo "make sure hash"
echo "The address is ${1}"

curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0x0d2b767809d5dd9a62cad1da22ac9401147cc1f0",
        "latest"
    ]
}'
