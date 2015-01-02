#!/bin/bash

id="$1"
video="/tmp/youtube.mp4"

killall kodi.bin
killall youtube-dl
killall omxplayer

rm $video*
youtube-dl "https://www.youtube.com/watch?v=$id" -o $video &
sleep 8
omxplayer -o hdmi $video*

killall youtube-dl
rm $video*

/home/pi/.xbmc-current/xbmc-bin/lib/kodi/kodi.bin --standalone -fs
