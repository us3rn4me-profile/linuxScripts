#!/usr/bin/env bash

echo "Enter the URL: "
read 'URL'
echo 
echo Formats loading... 
youtube-dl --list-formats $URL 
echo
echo "Select format:"
read format
youtube-dl -cf $format $URL && echo -e "\033[32mThe download finished"

