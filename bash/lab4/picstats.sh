#!/bin/bash

#Some variables
directoryofpics=~/workspace/cdzula96/bash/lab1/Pictures
numberOfFilesToDisplay=3

#If the user needs help
function usage {
    echo "Usage: $0 [he|--help] [directoryToWorkOn] [-co|--count numberOfFilesToDisplay]"
    echo "The default is set to 3: Directory defaults to ~/workspace/cdzula96/bash/lab1/Pictures in this case"
}

# Script
gotadirectory=n

# Commands assisted with the output
echo -n "In the ~/workspace/cdzula96/bash/lab1/Pictures directory, amount of files is "
find $directoryofpics -type f | wc -l

echo -n "Those files are using "
du -sh $directoryofpics | awk '{print$1}' 
echo "of storage on your machine"

echo ""

echo "The $numberOfFilesToDisplay biggest files in the directory are (from"

echo ""
du -h $directoryofpics/* |sort -h |tail -$numberOfFilesToDisplay