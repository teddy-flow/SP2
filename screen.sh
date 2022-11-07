#!/bin/bash
# Script: status.sh
# Purpose: start 4 screens with their commands
# Author: Bjørn Martin Hegnes
# -------------------------------------------------------
# stop confliting wifi prosseses
sudo systemctl stop wpa_supplicant
sudo service NetworkManager stop
# start gps
sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock
#start screen
screen -dmS status
screen -S status -X screen watch bash -c /home/pi/status.sh
# hcxdumptool
screen -dmS wlan1
screen -S wlan1 -X screen sudo hcxdumptool -i wlan1 -o /home/pi/hashes/wlan1/Wi-Fi_PMKI-wlan1-$(date +"%Y_%m_%d_%I_%M_%p").pcapng --enable_status=3
screen -dmS wlan2
screen -S wlan2 -X screen sudo hcxdumptool -i wlan2 -o /home/pi/hashes/wlan2/Wi-Fi_PMKI-wlan2-$(date +"%Y_%m_%d_%I_%M_%p").pcapng --enable_status=3
screen -dmS wlan3
screen -S wlan3 -X screen sudo hcxdumptool -i wlan3 -o /home/pi/hashes/wlan3/Wi-Fi_PMKI-wlan3-$(date +"%Y_%m_%d_%I_%M_%p").pcapng --enable_status=3
# kismet
screen -dmS kismet
screen -S kismet -X screen sudo kismet -c hci0 -c wlan4 -p /home/pi/war-drive
