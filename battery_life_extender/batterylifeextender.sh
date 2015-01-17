#!/bin/bash

########################################################################
# BatteryLifeExtender
########################################################################

# Notifies the user when plug or unplug the power cord to extend the overall battery life

# LICENSE
# This script is released under GNU GPLv3 license and is provided "as-is" with NO WARRANTY.
# I'm not responsible of any damage to your computer battery life.

# AUTHOR
# Francesco Pira
# fpira.com

########################################################################

status="$(pmset -g batt | egrep "([0-9]+\%).*" -o)"
substring1="discharging"
charge="$(cut -d '%' -f 1 <<< "$status")"

if [ "${status/$substring1}" = "$status" ] ; then
  #echo "charging..."
  if (( "$charge" >= 80 )) ; then
     # notify
     thescript='display notification "You can now unplug the power cord to extend the overall battery life." with title "BatteryLifeExtender" subtitle '
     the2part="\"Please unplug me! Charge is ${charge}%\""
     /usr/bin/osascript -e "${thescript}${the2part}"
  fi
else
  #echo "discharging..."
  if (( "$charge" <= 40 )) ; then
     # notify
     thescript='display notification "You should plug your mac to a power outlet to extend the overall battery life." with title "BatteryLifeExtender" subtitle '
     the2part="\"Please plug me! Charge is ${charge}%\""
     /usr/bin/osascript -e "${thescript}${the2part}"  
  fi
fi
