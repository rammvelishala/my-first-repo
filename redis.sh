#!/bin/bash
echo "---------------------------------------------"
now=$(date)
echo "$now"
pid=$(pgrep -f "redis-server")
if [ -z "$pid" ]; then
echo "No redis process running"
else
echo "stopping redis process :$pid"
kill -9 $pid
fi

sleep 2
#if [ -z "$pid" ]; then
#       echo "redis is not running"
#else   kill "$pid"
#fi
#start redis
/usr/bin/redis-server &

echo "redis-started"
sleep 5
redis-cli -c -p 6379 CONFIG SET protected-mode no
redis-cli -c -p 6379 flushall
redis-cli -c -p 6379 flushdb
redis-cli -c -p 6379 ping
