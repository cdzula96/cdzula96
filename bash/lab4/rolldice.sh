#!/bin/bash

# Chandler 200327666

declare -i dicetoroll=0 
declare -i sides=0 

function usage {
  echo "Usage: $0 [-h] [-c amountofdice] [-s 4 to 20]" # must be between 4 and 20
}

function error-message {
  echo "$@" >&2
}

while [ $# -gt 0 ]; do
  case "$1" in
    
    -c )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        dicetoroll=$2
        shift
      else
        error-message "'$2' is the number of dice to roll, please try again"
        exit 1 # error message
      fi
      ;;
      
    -h )
      usage
      exit 0
      ;;
    
    -s )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
      if [ $2 -lt 4 -o $2 -gt 20 ]; then
          error-message "Sides must be between 4 and 20"
          exit 1 # error-message
        else
          sides=$2
          shift
        fi
      else
        error-message "You gave me '$2', I cannot roll that"
        exit 1
      fi
      ;;
      
    * )
      error-message "I am unsure of this '$1'"
      usage
      exit 1
      ;;
  esac
  shift
done

until [ $dicetoroll -gt 0 ]; do
  read -p "How many dice shall I roll? " dicetoroll
done

until [ $sides -gt 3 -a $sides -lt 21 ]; do
  read -p "Pick the sides each die should have, between [4 to 20] " sides
done

endamount=0
for (( rolls=0 ; rolls < dicetoroll ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM % $sides +1))
  endamount=$((endamount + die1))

# end result
#   echo "Rolled $die1"
echo " Rolled dice$((rolls+1)) with a value of $die1 "
done
echo "Total roll amounted to $endamount"