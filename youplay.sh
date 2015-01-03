#!/bin/bash

id="$1"
video="/tmp/youtube.mp4"
if [ "$2" != "" ]
then
  q="-f $2"
else
  q=""
fi

#killall kodi.bin
ps ux|grep youtube|awk '{print $2}'|while read pid;do kill $pid;done
#ps ux|grep omxplayer|awk '{print $2}'|while read pid;do kill $pid;done

echo "<h2>Retrieving Video</h2>"
rm $video*
youtube-dl --no-part $q "https://www.youtube.com/watch?v=$id" -o $video &
sleep 10
echo "<h2>Loading Video</h2>"
#sleep 5

wget -q -O- "http://localhost:8090/jsonrpc?request={%22jsonrpc%22:%222.0%22,%22method%22:%22Player.Open%22,%22params%22:{%22item%22:{%22file%22:%22$video%22}},%22id%22:%221%22}"
echo "<h2>Playing Video</h2>"
#ps ux|grep youtube|awk '{print $2}'|while read pid;do kill $pid;done

#/home/pi/.xbmc-current/xbmc-bin/lib/kodi/kodi.bin --standalone -fs
