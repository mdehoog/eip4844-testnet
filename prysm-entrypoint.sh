#!/bin/bash

PUBLIC_IP=$(curl -s v4.ident.me)
echo "Host IP: $PUBLIC_IP"
./beacon-chain \
--eip4844 \
--accept-terms-of-use \
--genesis-state=./genesis.ssz \
--subscribe-all-subnets \
--min-sync-peers=1 \
--http-web3provider=$HTTP_WEB3PROVIDER \
--p2p-host-ip=$PUBLIC_IP
# - --verbosity=debug
