#!/usr/bin/env bash

MP4F=$(ls ~/Music/ | grep .mp4)
for filename in $MP4F
do 
 name=`echo "$filename" | sed -e "s/.mp4$//g"`
 ffmpeg -i ~/Music/$filename -b:a 192K -vn ~/Music/$name.mp3
done
