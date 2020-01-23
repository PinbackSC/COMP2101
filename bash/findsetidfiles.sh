#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired
echo ""
echo "Setuid files:"
echo "============="
echo ""
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo ""

#For task one, we are just sorting it by the group. So I changed the 3 to a 5 so it sorts by the group collumn.
echo "Task 1"
echo "============="
echo ""
echo "Sorting by groups..."
echo ""
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 5

#For task 2 this generates the largest regular files in the system, sorted by their size in MBs
#Displays only the following:
# File name ; Owner ; Size in MBs.

echo "Task 2"
echo "============"
echo ""
echo "Sorting by file size..."
echo ""
# for this script I had to take out the -perm -### because we are not looking for setid files with permission values
# I also adjusted the sort command, added an awk command and a head command.

# these are the commands I am using and why:
# find /-type F -exec (Find the files)
# ls --block-size=MB {}  (list them in a human readable format, in this case use megabytes)
# + 2>/dev/null (Forward errors)
# Sort -rn (Meaning we dp a reverse numarical sort... r = reverse and n = numerical)
# awk '(print $1, $4, $10)' (adjust the output so it will only give the values for collumn 1, 4, and 10)
# head - 10 (show only the top 10 files found)

# all of these done in a pipeline so it takes the input of the first command and feeds it to the next. first we need to find the files, adjust how the file sizes are displayed and
# forward the errors. Then it takes the output of that, sort it in reverse order so the largest is at the top, also sort it numerically, then it takes
# the output and we we run it through an awk command to limit the output to what we only want to see, which is the file name, owner, and the file size.
# Then finally we run it through the head command so it shows the first 10 results and cuts out the rest.

find / -type f -exec ls -lsh --block-size=MB {} + 2>/dev/null | sort -rn |awk '{print $1, $4, $10}' | head -10;
