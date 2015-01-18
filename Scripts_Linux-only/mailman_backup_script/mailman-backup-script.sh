#!/bin/bash

# mailman-backup-script 
# Backups mailman archives
#
# Copyright (C) 2015 Francesco Pira <francescopira.me@gmail.com> 
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script.  If not, see <http://www.gnu.org/licenses/>.

# developer's website: fpira.com


# Future features:
# add overwrite alert: if backup folder is present the script asks to overwrite it. If so removes it and executes.

# NOTES

     # INPUT="/var/lib/mailman/archives/"
     # OUTPUT="/var/lib/mailman/mailman-txt-backup/"
     # OUTPUT="/var/lib/mailman/mailman-html-backup/"

# GZIPing
# tar -cvzf /var/lib/mailman/mailman-txt-backup.tar.gz /var/lib/mailman/mailman-txt-backup/
# tar -cvzf /var/lib/mailman/mailman-html-backup.tar.gz /var/lib/mailman/mailman-html-backup/

# RESTORE (on new server)
# cp -ri /path/to/mailman-html-backup/ /var/lib/mailman/archives/
# cp -ri /path/to/mailman-txt-backup/ /var/lib/mailman/archives/



if [[ $EUID -ne 0 ]]; then
     echo "Aborted. This script must be run as root." 1>&2
     exit 1
else 
     echo "Running as root..."
     if [[ $# != 1 ]]; then
          echo "usage: mailman-backup-script.sh format"
          echo "available format options: txt, html"
     else
          hash rsync 2>/dev/null || { echo >&2 "rsync required but it's not installed. Aborting."; exit 1; }

          #INPUT="/Users/francesco/Desktop/test-input/"
          INPUT="/var/lib/mailman/archives/"

          if [[ $1 == "txt" ]]; then

               #OUTPUT="/Users/francesco/Desktop/test-input/mailman-txt/"
               OUTPUT="/var/lib/mailman/mailman-txt-backup/"

               echo "Working... Saving output to log file in current dir ($( pwd ))"
               echo "Skipping mailman attachments..."
               #rsync -avm --include='*.txt' -f 'hide,! */' "$INPUT" "$OUTPUT" > ./mailman-backup-script.log 2>&1
               rsync -avm --exclude attachments/ --include='*.txt' -f 'hide,! */' "$INPUT" "$OUTPUT" > ./mailman-backup-script.log 2>&1
               echo "Done!"
               exit 0
          elif [[ $1 == "html" ]]; then

               #OUTPUT="/Users/francesco/Desktop/test-input/mailman-html/"
               OUTPUT="/var/lib/mailman/mailman-html-backup/"

               echo "Working... Saving output to log file in current dir ($( pwd ))"
               echo "Skipping mailman attachments..."
               #rsync -avm --include='*.html' -f 'hide,! */' "$INPUT" "$OUTPUT" > ./mailman-backup-script.log 2>&1 #with attachments
               rsync -avm --exclude attachments/ --include='*.html' -f 'hide,! */' "$INPUT" "$OUTPUT" > ./mailman-backup-script.log 2>&1
               echo "Done!"
               exit 0
          else
               echo "usage: mailman-backup-script.sh format"
               echo "available format options: txt, html"
          fi
     fi
fi







