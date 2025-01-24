#!/bin/bash

# Check Redis 6 status
REDIS6_STATUS=$(systemctl is-failed redis6)

if [ "$REDIS6_STATUS" == "failed" ]; then
    # Redis 6 is in a failed state, start it
    sudo systemctl start redis6
    sleep 5
        redis6-cli CONFIG SET protected-mode no
        redis6-cli flushall
        redis6-cli flushdb
        redis6-cli ping
    echo "Redis 6 was in a failed state. Starting Redis 6."
else
    echo "Redis 6 is running or not in a failed state."
fi

