#!/bin/bash
# -------------------------------------------------------
# cpu temp
cpu=$(</sys/class/thermal/thermal_zone0/temp)
# grep gps location
x=$(gpspipe -w -n 10 |grep lon|tail -n1|cut -d":" -f9|cut -d"," -f1)
y=$(gpspipe -w -n 10 |grep lon|tail -n1|cut -d":" -f10|cut -d"," -f1)
# the output
echo "$(date) @ $(hostname)"
echo "-------------------------------------------"
echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
echo "CPU => $((cpu/1000))'C"
echo "GPS => $x,$y"
echo "-------------------------------------------"
echo "Screen => $(screen -ls)"
echo "-------------------------------------------"
echo "Wlan 1 => $(ls -lht /home/pi/hashes/wlan1 | head -2)"
echo "Wlan 2 => $(ls -lht /home/pi/hashes/wlan2 | head -2)"
echo "Wlan 3 => $(ls -lht /home/pi/hashes/wlan3 | head -2)"
echo "-------------------------------------------"
echo "kismet status => $(curl -Is localhost:2501 | head -n 1)"