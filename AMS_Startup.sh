#!/bin/bash
echo "---------------------------------------------"
now=$(date)
echo "$now"
SERVICE="AMS.Accommodation.API.dll"
if ! pgrep -f "dotnet AMS.Accommodation.API.dll" >/dev/null
then
    echo "$SERVICE is stopped"

    cd /app-hosting/dotnet-hosting/accom-uat.guruvayurdevaswom.in/
    export AESKEY="QrfouXkUh3Zo8h+op1CgBY5TZ29iE+LL4hEJb93djIA="
    nohup dotnet AMS.Accommodation.API.dll </dev/null &>/dev/null &
    echo "AMS Application Started Sucessfully"
    echo $AESKEY


else
    echo "$SERVICE running"
fi


