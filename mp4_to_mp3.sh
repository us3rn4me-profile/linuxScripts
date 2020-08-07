#!/usr/bin/env bash

directory=$(pwd)
MP4=$(ls $directory | grep .mp4)
for filename in $MP4
do
  name=`echo "$filename" | sed -e "s/.mp4$//g"`
  ffmpeg -i ~/$directory/$filename -b:a 192K -vn ~/$directory/$name.mp3
done
