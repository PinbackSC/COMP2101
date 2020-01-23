#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
# put the number of sides in a variable which is used as the range for the random number
sides=6
# creating the bias value variable
bias=1
# roll the dice and save the results
die1=$(( RANDOM % $sides + $bias))
die2=$(( RANDOM % 6 + 1 ))
# display the results
echo "Rolling your dice... "
echo ""
echo "You rolled a $die1,and a $die2"
echo ""
#Create the sum variable, as we will need it later.
#to get the value of the sum variable, we add the 2 dice values together useing their respective variables
sum=$(($die1 + $die2))
#Calculate the sum of what was rolled, and summarize it to the user
echo "Calculating sum of the dice rolled..."
echo ""
echo "the sum of your roll is: $sum"
echo ""
#Calculate the average of what was rolled, and summarize it to the user
#This script right now, has no way to deal with remainders caused by deviding by 2
#So i let the user know they might have a remainder of 1. 
echo "Calculating roll average..."
echo ""
echo "the average of your roll is: $(($sum / 2))"
echo ""
echo "I know, it might not be super accurate, but... bash does not deal with decimals."
echo ""
echo "You might have a remainder of 1"
