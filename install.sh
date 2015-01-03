#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   echo "Trying to restart script as root"
   sudo $?
   exit
fi

busybox="/bin/busybox"
www="/etc/www"
cgi="$www/cgi-bin"
cmd="$busybox httpd -p 8080 -h $www"
youtubedl="/usr/local/bin/youtube-dl"

if [ ! -f $busybox ] || [ ! -f $youtubedl ]; then
  apt-get update && apt-get install busybox -y
  wget http://yt-dl.org/downloads/2015.01.02/youtube-dl -O $youtubedl
fi

sed -i "/exit 0/d" /etc/rc.local
sed -i "/$cmd/d" /etc/rc.local
echo "$cmd" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

mkdir -p $cgi
cd $cgi
rm *
wget --no-check-certificate "https://raw.githubusercontent.com/metalx1000/YouPi/master/www/cgi-bin/youplayer.cgi"
chmod +x *.cgi

cd /usr/local/bin/
rm youplay.sh
wget --no-check-certificate "https://raw.githubusercontent.com/metalx1000/YouPi/master/youplay.sh"
chmod +x youplay.sh

$cmd
