#!/bin/sh

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

if [ $MINUTES == 0 ] && [ $SECONDS == 0 ] # timer has ended
    then
    for i in `seq 1 180`;
    do
clear
echo "00:00" # end of timer

sleep 1

clear
done
break

else
echo "$MINUTES:$SECONDS"  # this is to display the time remaining
sleep 1
fi
done    # script is finished