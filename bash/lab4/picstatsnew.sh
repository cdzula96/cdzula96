#!/bin/bash

### Variables
directory=~/workspace/cdzula96/bash/lab1/Pictures
numberOfFilesToShow=3

### Functions
function usage {
    echo "Usage: $0 [h|--help] [-c|--count numberOfFilesToDisplay] [directoryToWorkOn]"
    echo "Count defaults to 3, Directory defaults to ~/Pictures"
}

### Command line processing
gotadirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) # show usage of diagram
        usage
        exit 0
        ;;
    -c | --count ) # specify how many big files to display
        if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
            numberOfFilesToShow=$2
            shift
        else
            usage
            error-message "Count requires a number"
            exit 1
        fi
        ;;
    * ) # grab the directory name to work on
    # if we havent got a directory from the command line yet, this must be it.
    if [ $gotadirectory = "no" ]; then
        directory=$1
        gotadirectory="yes"
    # otherwise this is some kind of command line garbage
    else
        usage
        error-message "I did not understand '$1' as a directory, I already had a directory $directory"
        exit 1
    fi
        ;;
    esac
    shift
done

### Main

#commands done with Dennis in class
echo -n "In the ~/workspace/cdzula96/bash/lab1/Pictures directory, the number of files is "
find $directory -type f | wc -l

echo -n "Those files use "
du -sh $directory | awk '{print$1}'

echo "The $numberOfFilesToShow largest files are:"
echo "----------"
du -h $directory | sort -h | tail $numberOfFilesToShow