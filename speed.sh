#!/bin/bash 

#Get MY PATH
MY_PATH="`dirname \"$0\"`" 

#create CSV-file if it does not exist
touch monitor.csv

#Do speedtest with share option enabled to receive PNG
speedtest=$(speedtest --share | tac -s "Share results: ")

#extract lines for CSV
download=$(echo "$speedtest" | grep Download)
upload=$(echo "$speedtest" | grep Upload)
url=$(echo "$speedtest" | grep http)

#get date for filename and CSV
date=$(date +%m%d_%H%M)

#download PNG
cd $MY_PATH && wget -O $date.png $url

#generate output string
output="$date;"
#iterate through the download and upload line
for i in $download
do
    output+=$(echo -e "\t$i;")
done
for i in $upload
do
    output+=$(echo -e "\t$i;")
done

#finalize output string for csv
output+="Dateiname/Beweis:;=HYPERLINK(\"./$date.png\")"

#write string to csv
echo "$output" >> monitor.csv
