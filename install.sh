#!/bin/bash

#to be run on a Raspberry Pi running a debian based distro as sudo or root
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   echo "Trying to restart script as root"
   sudo $?
   exit 1
fi

apt-get update
apt-get install libpcre3 fonts-freefont-ttf youtube-dl -y
cd /tmp
wget "http://omxplayer.sconde.net/builds/omxplayer_0.3.6~git20141024~98982df_armhf.deb" -O omxplayer.deb
dpkg -i omxplayer.deb


