#!/bin/bash

PUBLIC_IP=$(curl -s v4.ident.me)
echo "Host IP: $PUBLIC_IP"
./beacon-chain \
--eip4844 \
--accept-terms-of-use \
--genesis-state=./genesis.ssz \
--subscribe-all-subnets \
--rpc-host 0.0.0.0 \
--rpc-port 4000 \
--grpc-gateway-host 0.0.0.0 \
--grpc-gateway-port 3500 \
--enable-debug-rpc-endpoints \
--min-sync-peers=1 \
--http-web3provider=$HTTP_WEB3PROVIDER \
--p2p-host-ip=$PUBLIC_IP \
--peer=enr:-MK4QFURnlP5nu_JHdrj6XVYPo4an3tLVD3Ii_hLpFxAvdaVVLOOHPzmAYQQ4lk1U2fwb4oQIh-lYL3UbpTGYr-yJjKGAYO2dGzih2F0dG5ldHOIAAAAAAAAAACEZXRoMpCcZxEogwAP_f__________gmlkgnY0gmlwhCJ5ITWJc2VjcDI1NmsxoQIlwaxycUgJ_Ht4lYdDlInbIuRxu0HcHcFbu0D7As2SLYhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A \
--peer=enr:-MK4QCC-n6C8hHOsUacSgYR7E2UknE_Slz5Tt8h0FiSKxiXDBrki2iwIALq9FIPreXp2GgFJqFM4Bd-1oMlrHgOPKY2GAYO2dG08h2F0dG5ldHOIAAAACAAAAACEZXRoMpCcZxEogwAP_f__________gmlkgnY0gmlwhCJ6vpeJc2VjcDI1NmsxoQNJzjxNKr7-a-iEDs0KvaL_vo1UH91kefEiWzgAdwSntYhzeW5jbmV0cw-DdGNwgjLIg3VkcIIu4A
# - --verbosity=debug
