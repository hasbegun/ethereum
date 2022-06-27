echo "make sure hash value."
echo "Unlock account $1"

curl --location --request POST 'http://localhost:8545' \
     --header 'Content-type: application/json' \
     --data-raw '{
        "jsonrpc": "2.0",
        "id": 6,
        "method": "personal_unlockAccount",
        "params": [
            "0x0d2b767809d5dd9a62cad1da22ac9401147cc1f0",
            "5uper53cr3t"
        ]
    }'

curl --location --request POST 'http://localhost:8545' \
     --header 'Content-type: application/json' \
     --data-raw '{
        "jsonrpc": "2.0",
        "id": 6,
        "method": "personal_unlockAccount",
        "params": [
            "0x5e234a32186B1b366bb0bb6367425dDaf1b07a03",
            "5uper53cr3t"
        ]
    }'

curl --location --request POST 'http://localhost:8545' \
     --header 'Content-type: application/json' \
     --data-raw '{
        "jsonrpc": "2.0",
        "id": 6,
        "method": "personal_unlockAccount",
        "params": [
            "0x7CBDc8B07446C9517874b1fcBE6Efb1d2b6634d6",
            "5uper53cr3t"
        ]
    }'

curl --location --request POST 'http://localhost:8545' \
     --header 'Content-type: application/json' \
     --data-raw '{
        "jsonrpc": "2.0",
        "id": 6,
        "method": "personal_unlockAccount",
        "params": [
            "0x70D3908DBf2D4b16DDc3d0a957667F31A62aF857",
            "5uper53cr3t"
        ]
    }'

curl --location --request POST 'http://localhost:8545' \
     --header 'Content-type: application/json' \
     --data-raw '{
        "jsonrpc": "2.0",
        "id": 6,
        "method": "personal_unlockAccount",
        "params": [
            "0x8791b9bb0B8eFE4ef29A1e84002e052424B2c29B",
            "5uper53cr3t"
        ]
    }'
