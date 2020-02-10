#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

#==============================================================================#

#Task 1
#Creating variables to hold the information of the existing script. This cleans up the code and makes it look better.
myHostName=$(hostname)
interfaceName=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
lanAddress=$(ip a s $interfaceName |awk '/inet /{gsub(/\/.*/,"");print $2}')
lanHostName=$(getent hosts $lanAddress | awk '{print $2}')
externalIP=$(curl -s icanhazip.com)
externalName=$(getent hosts $externalIP | awk '{print $2}')

#Task 2
routerAddress=$(route -n | grep '^0.0.0.0' | awk '{print $2}')
routerHostName=$(getent hosts 172.0.0.1 | awk '{print $2}')


#Replaced the outputs with new variables created with existing code
#for Task 2 I added the output for router address and router host name
cat <<EOF
Hostname        : $myHostName
LAN Address     : $lanAddress
LAN Hostname    : $lanHostName
External IP     : $externalIP
External Name   : $externalName


Router Address  : $routerAddress
Router HostName : $routerHostName
EOF


#==============================================================================#

#cat <<EOF
#Hostname        : $(hostname)
#LAN Address     : $(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}')|awk '/inet /{gsub(/\/.*/,"");print $2}')
#LAN Hostname    : $(getent hosts $(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}'))|awk '/inet /{gsub(/\/.*/,"");print $2}' | awk '{print $2}')
#External IP     : $(curl -s icanhazip.com)
#External Name   : $(getent hosts $(curl -s icanhazip.com) | awk '{print $2}')
#EOF
