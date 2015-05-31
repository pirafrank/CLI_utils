#!/bin/bash

#########################################################################
# Folder Mirror Script <https://github.com/pirafrank/CLI_utils>
# Mirror source to destination
#
# Copyright (C) 2015 Francesco Pira <dev@fpira.com> 
#
# This file is part of CLI_utils.
#
# CLI_utils is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# CLI_utils is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CLI_utils. If not, see <http://www.gnu.org/licenses/>.
#
#########################################################################

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

