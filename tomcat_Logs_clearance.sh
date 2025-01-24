#!/bin/bash
# Program Name: tomcat_Logs_clearance.sh.sh
log=$(find /app-hosting/apache-tomcat-9.0.33/logs -type f -mtime +15)
if [ -n "$log" ]; then
echo "logs are greater than fifteen days."
find /app-hosting/apache-tomcat-9.0.33/logs -type f -mtime +15 -exec rm {} \;
else
echo "logs are not greater than fifteen days."
fi
