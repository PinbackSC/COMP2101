#!/bin/bash
# This is my third script, its an ugly way to saying Hello World!
#Also Dennis hates us because he told us to type it out manually, and i encoutered
#errors because I missed a slash in the second line which broke the script.
#it took me 5 minutes to figure out the issue, lol.

echo -n "helb wold" |
  sed -e "s/b/o/g" -e "s/l/ll/" -e "s/ol/orl/" |
  tr "h" "H"|
  tr "w" "W"|
  awk '{print $1 "\x20" $2 "\41"}'
bc <<< "(($$ * 4 - 24)/2 + 12)/2" |
  sed 's/^/I am process # /'
