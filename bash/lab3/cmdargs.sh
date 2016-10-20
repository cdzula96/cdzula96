#!/bin/bash

# Loop through the command line arguments
while [ $# -gt 0 ]; do

    # Display each argument on its own line
    echo "$1"
    
    # Each time through the loop, shift the arguments left
    # this decrements the argument count for us
    shift
done
