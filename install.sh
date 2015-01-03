#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   echo "Trying to restart script as root"
   sudo $?
   exit 1
fi

busybox="/user/bin/busybox"
www="/etc/www"
cgi="$www/cgi-bin"
cmd="$busybox httpd -p 8080 -h $www"

if [ ! -f $busybox ]; then
  apt-get update && apt-get install busybox
fi

sed -i "s/exit 0//g" /etc/rc.local
sed -i "s/$cmd//g" /etc/rc.local
echo "$cmd" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

mkdir -p $cgi
cd $cgi
wget --no-check-certificate "https://raw.githubusercontent.com/metalx1000/YouPi/master/www/cgi-bin/youplayer.cgi"

$cmd
