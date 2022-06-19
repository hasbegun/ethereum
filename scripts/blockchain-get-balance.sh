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
curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0x70d3908dbf2d4b16ddc3d0a957667f31a62af857",
        "latest"
    ]
}'
curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0x7cbdc8b07446c9517874b1fcbe6efb1d2b6634d6",
        "latest"
    ]
}'
curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0x5e234a32186b1b366bb0bb6367425ddaf1b07a03",
        "latest"
    ]
}'
curl --location --request POST 'localhost:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 4,
    "method": "eth_getBalance",
    "params": [
        "0x8791b9bb0b8efe4ef29a1e84002e052424b2c29b",
        "latest"
    ]
}'
