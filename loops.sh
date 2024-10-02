#!/bin/bash

USERID=$(id -u)
R="\e[31m"
N="\e[0m"

if [ USERID -ne 0 ];
then
    echo -e "$R ERROR:: PLEASE RUN THIS COMMAND WITH ROOT ACCESS $N" 
    exit 1
fi

#all args are in $@

for i in $@
do
    apt install $i -y 
done    

