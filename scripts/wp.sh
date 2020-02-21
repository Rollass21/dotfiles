#!/bin/bash

# Outputs weeknumber, english translation and czech translation
# separated with spaces.

wn=$(date +%V)
if [ $((wn%2)) -eq 0 ] ; then
    echo "$wn even sudy"
else
    echo "$wn odd lichy"
fi
exit 0
