# Speedmonitor
This Script uses the speedtest-cli to create a csv and a PNG File to log the speed of your internet connection.
It requires obviously speedtest-cli and wget.

It works best with cron.
Example crontab, which will execute the script every hour at the 35th minute:
35 * * * * your/path/to/the/script/speed.sh >> your/path/to/the/script/out.log
