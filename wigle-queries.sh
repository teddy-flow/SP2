#!/bin/bash
# Script: wigle-wifi-search.sh
# Purpose: search wigle.net for WiFi AP by the MAC address.
# Author: Bjørn Martin Hegnes <www.hegnes.tech> under GPL v2.x+
# -------------------------------------------------------
MAC="mac.txt"
while IFS= read -r MAC
do
    IFS=:
    set $MAC
    var1=$1
    var2=$2
    var3=$3
    var4=$4
    var5=$5
    test=$(echo $MAC | cut -c 16-17)


    curl -X GET "https://api.wigle.net/api/v2/network/search?onlymine=false&freenet=false&paynet=false&netid="$1"%3A"$2"%3A"$3"%3A"$4"%3A"$5"%3A"$test"" -H  "accept: application/json" -H  "authorization: Basic QUlEOWM2OGEzMGU5ZDRkMDdmNTI1YzNjOWUxOWZkNmYzZmU6ZGE0MTcyOWM3ODE3MDAxNGU4NTc5ZTczMDg5Yjk5MGY=" > temp.txt
    cat 'temp.txt'
    temp="temp.txt"
    a=$(cat $temp | grep trilat | cut -d":" -f8 | cut -d',' -f1)
    b=$(cat $temp | grep trilong | cut -d":" -f9 | cut -d',' -f1)
    c=$(cat $temp | grep ssid | cut -d":" -f10 | cut -d',' -f1 | sed 's/"//' | sed 's/"//')
    d=$(cat $temp | grep firsttime | cut -d'"' -f30 | cut -d'"' -f1)
    e=$(cat $temp | grep netid | cut -d'"' -f42 | cut -d'"' -f1)
    g=$(cat $temp | grep channel | cut -d":" -f37 | cut -d',' -f1)
    h=$(cat $temp | grep encryption | cut -d":" -f38 | cut -d',' -f1 | sed 's/"//' | sed 's/"//')

    # Wigle csv format
    # MAC,SSID,AuthMode,FirstSeen,Channel,RSSI,CurrentLatitude,CurrentLongitude,AltitudeMeters,AccuracyMeters,Type
    echo "$e,$c,$h,$d,$g,,$a,$b,,,WIFI" | tee -a wigle-export-temp.csv
    echo "was added to wigle-export.csv"
    sleep 2

done <"$MAC"