#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   echo "Trying to restart script as root"
   sudo $0
   exit
fi

busybox="/bin/busybox"
www="/etc/www"
cgi="$www/cgi-bin"
cmd="$busybox httpd -p 8080 -h $www"
youtubedl="/usr/local/bin/youtube-dl"

rm $youtubedl
wget "http://yt-dl.org/downloads/2015.01.02/youtube-dl" -O $youtubedl
chmod +x $youtubedl

cd $cgi
rm *
wget --no-check-certificate "https://raw.githubusercontent.com/metalx1000/YouPi/master/www/cgi-bin/youplayer.cgi"
chmod +x *.cgi

cd /usr/local/bin/
rm youplay.sh
wget --no-check-certificate "https://raw.githubusercontent.com/metalx1000/YouPi/master/youplay.sh"
chmod +x youplay.sh

$cmd
