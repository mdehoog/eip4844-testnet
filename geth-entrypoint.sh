#!/bin/bash

PUBLIC_IP=$(curl -s v4.ident.me)
echo "Host IP: $PUBLIC_IP"
./geth \
--eip4844 \
--config=./geth_static_nodes.toml \
--http \
--http.port=8545 \
--http.addr=0.0.0.0 \
--http.vhosts=* \
--http.api=engine,eth \
--authrpc.port=8551 \
--nat extip:$PUBLIC_IP
