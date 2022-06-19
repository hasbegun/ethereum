echo "send fund"
echo

curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 7,
    "method": "eth_sendTransaction",
    "params": [
        {
            "from": "0x0d2b767809d5dd9a62cad1da22ac9401147cc1f0",
            "to": "0x70d3908dbf2d4b16ddc3d0a957667f31a62af857",
            "value": "0x32"
        }
    ]
}'
