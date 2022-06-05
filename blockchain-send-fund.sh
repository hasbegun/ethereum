echo "make sure hash values for from and to."
echo

curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 7,
    "method": "eth_sendTransaction",
    "params": [
        {
            "from": "0x08d1f47128f5c04d7a4aee69e90642645059acd6",
            "to": "0x2bc05c71899ecff51c80952ba8ed444796499118",
            "value": "0xf4240"
        }
    ]
}'
