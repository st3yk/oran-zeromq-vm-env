#!/bin/env bash

ip ro add 10.45.0.0/16 via 10.53.1.2
route -n
# ip netns exec ue1 ip route add default via 10.45.1.1 dev tun_srsue
ip netns exec ue1 route -n
ip netns exec ue2 ip route add default via 10.45.1.1 dev tun_srsue
ip netns exec ue2 route -n
ip netns exec ue3 ip route add default via 10.45.1.1 dev tun_srsue
ip netns exec ue3 route -n
