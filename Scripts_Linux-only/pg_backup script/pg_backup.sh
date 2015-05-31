#!/bin/bash

#########################################################################
# PostgreSQL Backup Script <https://github.com/pirafrank/CLI_utils>
# Daily backup with rotation for your postgresql database
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

# WARNING: assuming you :
# - have already set up .pgpass file for root user
# - have already created mirror db and set up its permissions!



# variables
BACKUP_PATH="/root/pg_backups" # WITHOUT the trailing slash
DATE=$(date +%Y-%m-%d_%H.%M)
DBUSER="unstable"
DBNAME="unstable"

# checking if folder exists otherwise it and its ancestors are created
if [[ ! -d $BACKUP_PATH ]]; then
     mkdir -p $BACKUP_PATH
fi

cd $BACKUP_PATH
mkdir $DATE
cd $DATE

# backing up db
pg_dump --host=localhost --username=$DBUSER -w --format=t $DBNAME > "${DBNAME}_dump_${DATE}.tar"

# deleting unwanted backups
rotate-backups --hourly=0 --daily=5 --weekly=2 --monthly=2 --yearly=2 $BACKUP_PATH

# mirroring backup to 'yesterday' database
pg_restore --host=localhost --username=$DBUSER -w --format=t -c --dbname=yesterday "${DBNAME}_dump_${DATE}.tar"





