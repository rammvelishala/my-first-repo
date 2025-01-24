#!/bin/bash
echo "---------------------------------------------"
now=$(date)
echo "$now"
SERVICE="/app-hosting/apache-tomcat-9.0.33/conf/"
if ps aux | grep /app-hosting/apache-tomcat-9.0.33/conf/ | grep -v grep >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    cd /app-hosting/apache-tomcat-9.0.33/bin/
    sh startup.sh
    sleep 60s
    sh shutdown.sh
    sleep 15s
    stop_tomcat_pid_check=$(pgrep -f '/app-hosting/apache-tomcat-9.0.33')
    if [ $stop_tomcat_pid_check > 0 ]
    then
      echo "tomcat did not stop through script. Killing the process"
      kill -9 $stop_tomcat_pid_check
      sleep 5
    fi
    sh startup.sh

fi

