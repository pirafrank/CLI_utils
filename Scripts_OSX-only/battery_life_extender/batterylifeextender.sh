#!/bin/bash

########################################################################
# BatteryLifeExtender
########################################################################

# Notifies the user when plug or unplug the power cord to extend the overall battery life

# LICENSE 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
