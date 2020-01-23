#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables.
# Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

#prompt the user to enter data, so we can use it later
prompt="enter 3 numbers: "
#Reads the input from the user, and stores it in 3 variables
read -p "$prompt" firstNum secondNum thirdNum
echo ""
echo "Thanks!"
echo ""

#arithmetic calculations, storing the answer in their own variables
sum=$((firstNum + secondNum + thirdNum))
product=$((firstNum * secondNum * thirdNum))

echo "The sum of your numbers is: $sum"
echo "the product of your numbers is: $product"










#This is all old script we dont need anymore for this lab

#dividend=$((firstNum / secondNum))
#fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstNum/$secondNum}")

#cat <<EOF
#$firstNum plus $secondNum is $sum
#$firstNum divided by $secondNum is $dividend
#  - More precisely, it is $fpdividend
#EOF
