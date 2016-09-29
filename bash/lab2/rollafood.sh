#!/bin/bash

# Create an array containing 11 different food names. Create two variables with random numbers in them from 1-6 each. 
# Add the two numbers together and use the sum as an index to display a food from your array.

foods=("bean" "steak" "corn" "hamburger" "egg" "rice" "bacon" "yogurt" "granola" "fish" "pork")

die1=$((1 + $RANDOM % 6))
die2=$((1 + $RANDOM % 6))
dicetotal=$((die1 + die2))
foodindex=$((dicetotal - 2))

echo "Yum, I rolled $dicetotal which gives me ${foods[foodindex]}!"