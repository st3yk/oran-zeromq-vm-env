#!/bin/env bash

SESSION_NAME="zeromq"

# List of commands to run
commands=(
    # start 5g core
    'cd /oran/srsRAN_Project/docker && sudo docker compose up 5gc'
    # start oran sc ric
    'cd /oran/oran-sc-ric && sudo docker compose up'
    # start gnb
    'cd /oran/srsRAN_Project/build/apps/gnb && sleep 15 && sudo ./gnb -c /oran/gnb_zmq.yaml e2 --addr="10.0.2.10" --bind_addr="10.0.2.1"'
    # start ue
    'cd /oran/srsRAN_4G/build/srsue/src && sleep 20 && sudo ip netns add ue1 || true && sudo ./srsue /oran/ue_zmq.conf'
    # generate traffic
    'sudo ip ro add 10.45.0.0/16 via 10.53.1.2 || true && sleep 25 && iperf -c 10.45.1.2 -u -b 100M -i 1 -t 100'
)

# Start a new Tmux session in detached mode
tmux new-session -d -s "$SESSION_NAME" -n "initial"

# Loop through the commands and create a new Tmux window for each
for cmd in "${commands[@]}"; do
    # Create a new Tmux window and run the command inside a shell
    tmux new-window -t "$SESSION_NAME" bash -c "$cmd; echo 'Command completed: $cmd'; exec bash"
done

# Attach to the Tmux session
tmux attach-session -t "$SESSION_NAME"