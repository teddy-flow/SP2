# SP2: Operation Bloodhound - Cracking WiFi Passwords
Tool used during the Student Project 2: Operation Bloodhound - Cracking WiFi Passwords.

Website: [Hegnes.tech](https://www.hegnes.tech/) | Project: [Operation Bloodhound – Cracking WiFi Passwords](https://www.hegnes.tech/2022/09/30/operation-bloodhound-cracking-wifi-passwords/)

## wigle-kml-converter.sh
For parsing and converting Wigle KML to Wigle CSV format. The columns in the csv is the following:
<code>MAC,SSID,AuthMode,FirstSeen,Channel,RSSI,CurrentLatitude,CurrentLongitude,AltitudeMeters,AccuracyMeters,Type</code>

## wigle-queries.sh
For queries to wigle.net API with a list of mac addresses for WiFi information such as WiFi name, location, and more to a wigle CSV format. This will be used to find WiFi networks that are missing in the project's dataset. 

## status.sh
For checking the status during the data collection, it displays CPU and GPU temperature, GPS location, lists all of the active screens from screen, displays kismet status, lists all of the recently modified files in the WiFi hashes this makes it no need to switch to the screens with the hcxdumptool to see the status.

## screen.sh
For starting the gpsd host serve, stoping conflicting wifi processes, starting one screen with the status.sh, then three instances of screens with hcxdumptool for the different WiFi adapters, then the last screen is used for kismet. 

## hegnes.txt
The hegnes wordlist are filled with Norwegian words, names, last names, swearwords, and all of the streets for the biggest Norwegian cities and more.

## rules
compare with best64.rule the hegnes.rule did crack 2.6% less hashes, but did decrase the runtime by 102%.
