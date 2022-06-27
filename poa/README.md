Run an ethereum private network

1. Create new accounts
   >> ./new-acct.sh
   Outputs are config/accounts

2. Create genesis.json
   >> ./gnesis.**sh**
   genesis.json can be found at config.

3. Create bootnode key
   >> ./bootnodekey.sh
   node (private and public) keys can be found at config.

4. docker compose up
By default, only the first three nodes defined in the addresses array will be allowed to seal. To allow a new node to participate the network, that node needs to be proposed and voted in by 50% + 1 node. To do this, you can run in sequence:

docker-compose exec -T sealer-one geth --exec 'clique.propose("0xPublicAddress1", true)' attach
docker-compose exec -T sealer-two geth --exec 'clique.propose("0xPublicAddress2", true)' attach
At this point, the fourth node should be allowed to seal. To allow the fifth node to seal, you can run the following commands:

docker-compose exec -T sealer-one geth --exec 'clique.propose("0xPublicAddress1", true)' attach
docker-compose exec -T sealer-two geth --exec 'clique.propose("0xPublicAddress2", true)' attach
docker-compose exec -T sealer-four geth --exec 'clique.propose("0xPublicAddress3", true)' attach
At this point, the fifth node should start being able to seal blocks as well.

At any time, you can retrieve the list of authorized sealers by running:

docker-compose exec -T node geth --exec 'clique.getSigners()' attach
To vote a node out of the network, you can use the same commands as described before and simply replace true by false.

DOTO:
1. genesis.sh uses fixed account info. Need to fetch this info from config/accounts
2. node.sh and sealer.sh use fixed "enode:xxxx" value. Need to fetch this info dynamically.


ref: https://github.com/tableturn/geth-private-poa
https://medium.com/scb-digital/running-a-private-ethereum-blockchain-using-docker-589c8e6a4fe8