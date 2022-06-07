# SP2
Tool used during the Student Project 2 - Cracking WiFi Passwords 

## wigle-kml-converter.sh
For parsing and converting Wigle KML to Wigle CSV format. 

## wigle-queries.sh
For queries to wigle.net API with a list of mac addresses for WiFi information such as WiFi name, location, and more to a wigle CSV format. This will be used to find WiFi networks that are missing in the project's dataset. 

## status.sh
For checking the status during the data collection, it displays CPU and GPU temrature, GPS location, lists all of the active screens from screen, displays kismet status, lists all of the recently modified files in the WiFi hashes this makes it no need to switch to the screens with the hcxdumptool to see the staus.

## screen.sh
For starting the gpsd host serve, stoping conflicting wifi processes, starting one screen with the status.sh, then three instances of screens with hcxdumptool for the different WiFi adapters, then the last screen is used for kismet. 
