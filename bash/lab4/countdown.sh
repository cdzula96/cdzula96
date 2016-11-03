#!/bin/bash

# Chandler 200327666

function usage {
  echo "Usage of: $0 [-he] Please enter a minute value in the script to start the countdown."
}

function error-message {
  echo "$@" >&2
}

while [ $# -gt 0 ]; do
    case "$1" in
-he | --help )
        usage
        exit 0
        ;;
        
esac
shift
done

# get input from user
read -p "In minutes, what would you like to set the timer to?" -e TIMER
TIMER=$(( $TIMER*60 )) # this changes minutes to seconds

START=$(date +%s)

# if invalid input, keep asking until received appropiate number
while [ -1 ]; do
clear

NOW=$(date +%s) 
DIFFERENCE=$(( $NOW-$START ))  # difference in seconds
ELAPSEDTIME=$(( $TIMER-$DIFFERENCE ))    # time in seconds
MINUTES=$(( $ELAPSEDTIME/60 ))  # convert to minutes
SECONDS=$(( $ELAPSEDTIME - ($MINUTES*60) ))

if [ $MINUTES == 0 ] && [ $SECONDS == 0 ] # indicates that the timer has ended
    then
    for i in `seq 1 180`;
    do
clear
echo "The timer has ended "
echo "00:00" # end of timer

sleep 0.5

clear
done
break

else

echo "Time timer is counting down, to cancel press CTRL C"
echo "$MINUTES:$SECONDS"  # this is to display the time remaining
sleep 0.5
fi
done    # the script is fin :)