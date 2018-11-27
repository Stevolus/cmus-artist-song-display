#!/bin/bash

# Description: Output current artist and song being played in CMUS. This script is meant for headless 
#              raspberry pi music players using cmus, with a 16x2 LCD display attached. This output 
#              gets handed over to whatever app handles displaying output to the screen.
#
# Author: Steven Marchant
#
# Notes: Requires cmus and cmus-remote. Simply run script while cmus is playing a song. A suggestion
#        Would be to set a cron job for the script every 5 seconds. Music files which dont have tags 
#        will show "No artist or song info found"

artist=$(cmus-remote -Q | grep artist | cut -c 11-)
song=$(cmus-remote -Q | grep title | cut -c 11-)
status=$(cmus-remote -Q | grep status | cut -c 8-)

if [ "$artist" == "" ]; then

artist_lcd="No Artist info found"
else artist_lcd=$artist
fi

if [ "$song" == "" ]; then

song_lcd="No title info found"
else song_lcd=$song
fi

if [ "$status" == "" ] || [ "$status" == "stopped" ]; then
   echo "Nothing is currently playing."
   exit
elif [ "$status" = "playing" ]; then
   status_lcd="Now playing..."

elif [ "$status" == "paused" ]; then
   status_lcd="Paused."

fi

echo $status_lcd
echo Artist: $artist_lcd
echo Song: $song_lcd

