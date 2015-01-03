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

sed -i "/$cmd/d" /etc/rc.local

rm -fr $www

