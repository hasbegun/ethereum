#! /bin/bash

if [ -z "$1" ]; then
  C="US"
else
  C=$1
fi

if [ -z "$2" ]; then
  ST="California"
else
  ST=$2
fi

if [ -z "$3" ]; then
  L="San Francisco"
else
  L=$3
fi

if [ -z "$4" ]; then
  O="INNOX"
else
  O=$4
fi

if [ -z "$5" ]; then
  OU="IT"
else
  OU=$5
fi

if [ -z "$6" ]; then
  DOMAIN="innoxai.com"
else
  DOMAIN=$6
fi

if [ -z "$7" ]; then
  CHAINNAME="eth4438"
else
  CHAINNAME=$7
fi
CN=eth4438.$DOMAIN
KEY=../poa/config/nginx/eth4438.key
CRT=../poa/config/nginx/eth4438.crt

if [ ! -f $KEY ] || [ ! -f $CRT ]; then
openssl req -x509 -nodes -days 365 \
  -newkey rsa:4096 \
  -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN" \
  -addext "subjectAltName=DNS:$CN" \
  -keyout $KEY \
  -out $CRT
fi
echo "Your key and cert can be found at files dir."
echo "Country: $C, State: $ST, City: $L, Org: $O, Dept: $OU, CN:$CN"
echo "Key file: $KEY, Cert file: $CRT"
