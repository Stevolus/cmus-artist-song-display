#!/bin/bash

# Description: Output current artist and song being played in CMUS. This script is meant for headless 
#              raspberry pi music players using cmus, with a 16x2 LCD display attached. This output 
#              gets handed over to whatever app handles displaying output to the screen.
#
# Author: Steven Marchant
#
# Notes: Requires cmus and cmus-remote. Simply run script while cmus is playing a song. A suggestion
#        Would be to set a cron job for the script every 5 seconds. Music files which dont have tags 
#        will show "No artist or song info found"-test

artist=$(cmus-remote -Q | grep artist | cut -c 11-)
title=$(cmus-remote -Q | grep title | cut -c 11-)

if [ "$artist" == "" ]; then

echo "No Artist or"
echo "song info found"

else
echo Artist: $artist
echo Title: $title
fi
