#!/bin/bash
# Program Name: redis_log_clear.sh
log=$(find /var/log/redis -type f -mtime +2)
if [ -n "$log" ]; then
echo "logs are greater than two days."
find /var/log/redis -type f -mtime +2 -exec rm {} \;
else
echo "logs are not greater than two days."
fi
