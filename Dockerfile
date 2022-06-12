# usage:
# $ docker build --build-arg "USER=someuser" --tag test .
# $ docker run --rm test

FROM ethereum/client-go:latest

ARG ACCOUNT_PASSWORD=5uper53cr3t

COPY files/genesis.json /tmp
RUN geth init /tmp/genesis.json

# nodekey file is generated as a part of init process.
# Remove node key file. This docker image will be used for other node
# and if the key exists, it will use the same key casung conflict.
# if does not exist, will create a new one.
RUN rm -f ~/.ethereum/geth/nodekey

# Generate a new account for the ethereum blockchain
# WARN: DO NOT SHARE THE PASSWROD! DO NOT FORGET PASSWORD.
RUN echo ${ACCOUNT_PASSWORD} > /tmp/password && \
   geth account new --password /tmp/password \
   && rm -f /tmp/password

ENTRYPOINT [ "geth" ]
