#!/bin/bash

SESH="main"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
  # Set up your session
fi

# Attach to created session
tmux attach-session -t $session
