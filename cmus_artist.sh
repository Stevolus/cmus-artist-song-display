#!/bin/bash

# Description: Output current artist and song being played in CMUS
# Author: Steven Marchant
# Notes: Requires cmus and cmus-remote. simply run script while cmus is playing song.

artist=$(cmus-remote -Q | grep artist | cut -c 11-)
title=$(cmus-remote -Q | grep title | cut -c 11-)

echo Artist: $artist
echo Title: $title

