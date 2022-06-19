echo "make sure the hash"
echo

curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 8,
    "method": "eth_getTransactionByHash",
    "params": ["0xa96de080dfcb9c5f908528b92d3df55a0e230cf4e48ae178bb220862c2a544c7"
    ]
}'