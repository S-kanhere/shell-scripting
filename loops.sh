#!/bin/bash


DATE=$(date +%F)
LOGSDIR=/mnt/c/Users/shubh/Documents/DevOps/shellscripting/shellscript-logs

#/mnt/c/Users/shubh/Documents/DevOps/shellscripting/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)

R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR:: PLEASE RUN THIS COMMAND WITH ROOT ACCESS $N" 
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then 
        echo -e "Installing $2 ... $R Failure $N"
    else
        echo -e "Installing $2 ... $G Success $N"
    fi    
}

#all args are in $@

for i in $@
do
    apt list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed, let's install it"
        apt install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N" 
    fi


done    

#implement log files
#implement log files
#implement validations
#implement validations through functions
#Your script should check if the package is installed or not, if already installed print in yellow color
#if installed just print package is already installed, it should not run install command 