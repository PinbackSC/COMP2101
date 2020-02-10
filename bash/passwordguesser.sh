#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)

#=====================================
#=====================================

#Variables are global by default, so I am declaring the ones we plan to use
actualPassword="password"

echo "Hello, please input your password!"
echo ""
#Reads the input from the user, and stores it as a password attempt variable
read passwordAttempt
echo ""
echo ""
echo "Hold on we are attempting to log-in!"
echo ""
echo ""


#Since we are not using loops, I put together a nest of if statments to allow only
#up to 5 tries on the password.

if [ $passwordAttempt = $actualPassword ]; then
  echo "Welcome!"
  elif [ $passwordAttempt != $actualPassword ]; then
  echo "nope, try again (4 tries left)"
  echo ""
  read passwordAttempt
  echo ""
  if [ $passwordAttempt = $actualPassword ]; then
    echo "Welcome!"
  elif [ $passwordAttempt != $actualPassword ]; then
    echo "nope, try again (3 tries left)"
    echo ""
    read passwordAttempt
    echo ""
    if [ $passwordAttempt = $actualPassword ]; then
      echo "Welcome!"
    elif [ $passwordAttempt != $actualPassword ]; then
      echo "nope, try again (2 tries left)"
      echo ""
      read passwordAttempt
      echo ""
      if [ $passwordAttempt = $actualPassword ]; then
        echo "Welcome!"
      elif [ $passwordAttempt != $actualPassword ]; then
        echo "nope, try again (1 tries left)"
        echo ""
        read passwordAttempt
        echo ""
        if [ $passwordAttempt != $actualPassword ]; then
          echo "nope, you are out of tries"
        fi
      fi
    fi
  fi
fi



# old way
#[ $passwordAttempt = $actualPassword ] && echo "Correct!" || echo "Incorrect."
