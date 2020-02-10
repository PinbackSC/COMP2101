#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
hostname=$(hostname)
date=$(date +%A)
time=$(date +"%I:%M %p")


###############
# Main        #
###############

#For this task I looked at the test man pages, I had to google it.
#It showed that you can test if a string = string.

#So I took what I learned and used the test command to test if the variable date was matching any of the days of the week (as a string).
#it worked, and it was easy considering there is only 7 days to test for all I had to do was write the command 7 times and change the
#String it was testing against each time. If the date does not = the string, then it wont run the next command after the && and it will move on
#With the rest of the script.

##################
# What it means: #
##################

#Test if the date variable = "Day of the week String" and if it does, then the new title variable = "This title"

test $date = "Monday" && title="supreme Leader"
test $date = "Tuesday" && title="Cpt."
test $date = "Wednesday" && title="Lt."
test $date = "Thursday" && title="My dude,"
test $date = "Friday" && title="Mr."
test $date = "Saturday" && title="Dr."
test $date = "Sunday" && title="Gamer"

#Login-welcome.sh first part of lab 3. Stores the output in a variable instead of printing to the screen.
outputVariable="Welcome to planet $hostname  $title $USER! It is $date $time"

#Uses the cowsay command to print the variable containing the data
cowsay $outputVariable
