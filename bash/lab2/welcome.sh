#!/bin/bash

#This script prints out a welcome message using variables and command substitution

export MYNAME="Chandler Dzula"
mytitle="Supreme Commander"

planet=`hostname`
weekday=$(date +%A)
echo "Welcome to planet $planet, $mytitle $MYNAME!"
echo "Today is $weekday."
