#!/bin/bash

APP_LOGS_DIR=/mnt/c/Users/shubh/Documents/DevOps/shellscripting/app-logs
DATE=$(date +%F)
LOGSDIR=/mnt/c/Users/shubh/Documents/DevOps/shellscripting/shellscript-logs

#/mnt/c/Users/shubh/Documents/DevOps/shellscripting/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "$FILES_TO_DELETE"

while read line
do
    echo "Deleting $line" &> $LOGFILE
    rm -rf $line
done < $FILES_TO_DELETE