#!/bin/bash

# folder mirror script
# mirror source to destination
#
# AUTHOR
# Francesco Pira
# fpira.com


# variables
SOURCE="/put/your/source/here" # example: SOURCE="/home/user/myfolder"
TARGET="/and/here/your/destination/" # example: TARGET="/home/user/Backups"

# checking if folder exists otherwise it and its ancestors are created
if [[ ! -d ${TARGET} ]]; then
     mkdir -p ${TARGET}
fi

# saving logs to home folder, if you don't want log, comment that part of the rsync command
cd ${HOME}

rsync -va --delete ${SOURCE} ${TARGET} --log-file="folder_mirror_script.log"

