#!/bin/bash -e

NETWORK_INTERFACE=eth0
DESTINATION_IP=10.244.0.34

sudo iptables -t nat -A PREROUTING -i $NETWORK_INTERFACE -p tcp --dport 443 -j DNAT --to-destination $DESTINATION_IP
sudo iptables -t nat -A PREROUTING -i $NETWORK_INTERFACE -p tcp --dport 80 -j DNAT --to-destination $DESTINATION_IP
sudo iptables -t nat -A PREROUTING -i $NETWORK_INTERFACE -p tcp --dport 4443 -j DNAT --to-destination $DESTINATION_IP
sudo iptables -t nat -A PREROUTING -i $NETWORK_INTERFACE -p tcp --dport 2222 -j DNAT --to-destination $DESTINATION_IP
sudo iptables-save
