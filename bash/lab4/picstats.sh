#!/bin/bash

# Chandler 200327666

# Some variables
directoryofpics=~/workspace/cdzula96/bash/lab1/Pictures
numberOfFilesToDisplay=3

# If the user needs help
function usage {
    echo "Usage: $0 [he |--help] [-dir | --directory to change directory] [-co |--count numberOfFilesToDisplay]"
    echo "The default is set to 3. The directory defaults to ~/workspace/cdzula96/bash/lab1/Pictures in this case"
}

function error-message {
    echo "$@" >&2
}

directoryofpicstures=n

while [ $# -gt 0 ]; do
    case "$1" in
-he | --help )
        usage
        exit 0
        ;;
        
-co | --count )
    if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
        numberOfFilesToDisplay=$2
        shift
    else
        usage
        error-message "Please check directory.."
        exit 1
    fi
    ;;
    
-dir | --directory )
       if [[ -d $2 ]]; then
        directoryofpics=$2
            shift
        else
        error-message "Cannot find the directory, verify path"
        exit 1 # exit code
    fi
        ;;

* ) 
    
    if [ $numberOfFilesToDisplay = "no" ]; then
        directoryofpicsnotthere=$1
        directoryofpics="yes"2
    else
        usage
        error-message "'$1' not a directory, the directory is $directoryofpics"
        exit 1
    fi
    ;;
esac
shift
done

# Commands assisted with the output
echo -n "In the ~/workspace/cdzula96/bash/lab1/Pictures directory, amount of files is "
find $directoryofpics -type f | wc -l

echo -n "Those files are using "
du -sh $directoryofpics | awk '{print$1}' 
echo "of storage on your machine"

echo ""

echo "The $numberOfFilesToDisplay biggest files in the directory are from"

echo ""
du -h $directoryofpics/* |sort -h |tail -$numberOfFilesToDisplay