#!/bin/bash

#variables define kara (Hi "Best Practice" ahe)
DIR_NAME="2nd-script"
FILE_NAME="2nd-file.txt"

#1. Create Directory | folder/directory banavne
mkdir -p ~/bash-scripts/$DIR_NAME  #'-p' mule jar folder aadhi asel tar error yenar nahi

#2. Make file and write text | file banvun tyat text add karayche
echo "Success" > ~/bash-scripts/$DIR_NAME/$FILE_NAME

#3. Check and show output | file madhe lihilele text read karnyasathi
echo "Checking file content:"
cat ~/bash-scripts/$DIR_NAME/$FILE_NAME
echo "Task Done!"
