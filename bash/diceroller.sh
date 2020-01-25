#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one

# roll the dice and display the result
echo "Setting up 20 sided dice..."
echo ""
echo "Rolling..."
echo ""
#We use the 20 + 1 to get an actual 1-20 roll. if there was no + 1 it would only go up to 19. 
echo "$(( RANDOM % 20 + 1)) / 20 rolled"
