#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   echo "Trying to restart script as root"
   sudo $?
   exit 1
fi

www="/etc/www"
cgi="$www/cgi-bin"
cmd="busybox -p 8080 -h $www"
apt-get update && apt-get install busybox

sed -i "s/$cmd//g" /etc/rc.local
echo "$cmd" >> /etc/rc.local

mkdir -p $cgi
cd $cgi
wget "https://raw.githubusercontent.com/metalx1000/YouPi/master/www/cgi-bin/youplayer.cgi"

$cmd
