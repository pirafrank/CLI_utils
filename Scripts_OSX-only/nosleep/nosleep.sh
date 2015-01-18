#!/bin/bash

# AUTHOR
# Francesco Pira
# fpira.com

let "MIN=$1 * 60"
echo "The system will stay awake for $1 minutes since now ($(date))."
echo "Do NOT close this terminal!" 
echo "You can now turn off the display."
caffeinate -i -t $MIN
