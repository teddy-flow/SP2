#!/bin/bash
# Script: wigle-kml-convert.sh
# Purpose: Wigle kml to Wigle csv converter
# Author: Bjørn Martin Hegnes <www.hegnes.tech>
# ---------------------------------------------
find -name "*.kml" | sed 's/[.]//' | sed 's/[/]//' > all-kml
# KML="KML INPUT"
KML="all-kml"
while IFS= read -r KML
do
    IFS=:
    set $KML

    cat $KML | awk 'FNR>91' | sed -n '/Cellular Networks/q;p'  | sed 's/            //' | sed 's/        //' | sed 's/    //'| sed 's/[/]//' | sed 's/<open>1<open>//' | sed 's/<description>Network ID: //' | sed 's/Encryption: //' | sed 's/Time: //' | sed 's/Signal: //' | sed 's/Accuracy: //' | sed 's/Type: //' | sed 's/<styleUrl>#mediumConfidence<styleUrl>//' | sed 's/<description>//' | sed 's/<Point>//' | sed 's/<coordinates>//' | sed 's/<coordinates>//' | sed 's/<Placemark>//' | sed 's/<styleUrl>#highConfidence<styleUrl>//' | sed 's/<styleUrl>#mediumConfidence<styleUrl>//' | sed 's/<styleUrl>#lowConfidence<styleUrl>//' | sed 's/<styleUrl>#bluetoothLe<styleUrl>//' | sed 's/Attributes: //' | sed 's/<Folder>//' | sed 's/<Document>//' | sed 's/<kml>//' | sed 's/[#]//' | sed 's/<styleUrl>//' | sed 's/<styleUrl>//' | sed 's/zeroConfidence//' | sed 's/Bluetooth Networks//' | sed 's/Cellular Networks//' | sed 's/cell//' | sed 's/bluetoothClassic//' | sed '/^$/d' | sed 's/<name>//' | sed 's/<name>//' | sed 's/^\s*$/(no SSID)/' | sed 's/$/,/' | awk 'ORS=NR%8?FS:RS' | awk -F, '{print $2,$1,$3,$4,'non',$5,$9,$8,'non',$6,$7}' OFS=, | awk 'BEGIN{FS=OFS=","} {gsub(/ /,"",$3); gsub(/ /,"",$5); gsub(/ /,"",$6); gsub(/ /,"",$7); gsub(/ /,"",$8); gsub(/ /,"",$10); gsub(/ /,"",$11); gsub(/ /,"",$1); gsub(/ /,"",$4)}1' | tee -a wigle-merged.csv

    cat $KML | awk 'FNR>91' | sed -e '1,/Bluetooth Networks/ d'  | sed 's/            //' | sed 's/        //' | sed 's/    //'| sed 's/[/]//' | sed 's/<open>1<open>//' | sed 's/<description>Network ID: //' | sed 's/Encryption: //' | sed 's/Time: //' | sed 's/Signal: //' | sed 's/Accuracy: //' | sed 's/Type: //' | sed 's/<styleUrl>#mediumConfidence<styleUrl>//' | sed 's/<description>//' | sed 's/<Point>//' | sed 's/<coordinates>//' | sed 's/<coordinates>//' | sed 's/<Placemark>//' | sed 's/<styleUrl>#highConfidence<styleUrl>//' | sed 's/<styleUrl>#mediumConfidence<styleUrl>//' | sed 's/<styleUrl>#lowConfidence<styleUrl>//' | sed 's/<styleUrl>#bluetoothLe<styleUrl>//' | sed 's/Attributes: //' | sed 's/<Folder>//' | sed 's/<Document>//' | sed 's/<kml>//' | sed 's/[#]//' | sed 's/<styleUrl>//' | sed 's/<styleUrl>//' | sed 's/zeroConfidence//' | sed 's/Bluetooth Networks//' | sed 's/Cellular Networks//' | sed 's/cell//' | sed 's/bluetoothClassic//' | sed '/^$/d' | sed 's/<name>//' | sed 's/<name>//' | sed 's/^\s*$/(no SSID)/' | sed 's/$/,/' | sed 's/;10//' | sed 's/[/]//' | sed 's/<description>//' | awk 'ORS=NR%8?FS:RS' | awk -F, '{print $2,$1,$7,$3,'non',$4,$9,$8,'non',$5,$6}' OFS=, | awk 'BEGIN{FS=OFS=","} {gsub(/ /,"",$3); gsub(/ /,"",$5); gsub(/ /,"",$6); gsub(/ /,"",$7); gsub(/ /,"",$8); gsub(/ /,"",$10); gsub(/ /,"",$11); gsub(/ /,"",$4); gsub(/ /,"",$1)}1' | tee -a wigle-merged.csv


done <"$KML"
rm all-kml