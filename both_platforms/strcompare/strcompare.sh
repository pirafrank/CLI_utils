#!/bin/bash

# AUTHOR
# Francesco Pira
# fpira.com

S1="$1"
S2="$2"

if [[ $S1 == "" || $S2 == "" ]]; then
     echo "Error: not enough arguments"
     exit -1
else
     if [[ $S1 == $S2 ]]; then
          echo "$(tput setaf 2)SUCCESS: strings match$(tput sgr 0)"
          exit 0
     else
          echo "$(tput setaf 1)Strings DO NOT match$(tput sgr 0)"
     fi
          exit 1
fi