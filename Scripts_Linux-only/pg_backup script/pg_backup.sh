#!/bin/bash

# @Author
# Francesco Pira
# fpira.com

# WARNING: assuming you :
# - have already set up .pgpass file for root user
# - have already created mirror db and set up its permissions!

# variables
BACKUP_PATH="/root/pg_backups" # WITHOUT the trailing slash
DATE=$(date +%Y-%m-%d_%H.%M)
DBUSER="unstable"
DBNAME="unstable"

# checking if folder exists, else create it
if [[ ! -d $BACKUP_PATH ]]; then
     mkdir $BACKUP_PATH
fi

cd $BACKUP_PATH
mkdir $DATE
cd $DATE

# backing up db
pg_dump --host=localhost --username=$DBUSER -w --format=t $DBNAME > "$DBNAME""_dump_$DATE.tar"

# deleting unwanted backups
rotate-backups --hourly=0 --daily=5 --weekly=2 --monthly=2 --yearly=2 $BACKUP_PATH

# mirroring backup to 'yesterday' database
pg_restore --host=localhost --username=$DBUSER -w --format=t -c --dbname=yesterday "$DBNAME""_dump_$DATE.tar"
