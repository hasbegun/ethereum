curl --location --request POST 'http://localhost:8545' \
--header 'Content-type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "id": 5,
    "method": "personal_newAccount",
    "params": [
        "5uper53cr3t"
    ]
}'
