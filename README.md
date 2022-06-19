In order to create enode, do 1 and 2

1. Create nodekey
  >> bootnode -genkey <datadir>/geth/nodekey

2. Create nodekey with the public key
  >> bootnode -nodekey <datadir>/geth/nodekey -writeaddress

3. Create account
  >> geth --datadir=./datadit account new

4. Add password
   >> echo "mypassword" >> ./config/master-password
