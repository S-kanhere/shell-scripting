#!/bin/bash

#Program goal is to install mysql

VALIDATE(){
    
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
        echo "ERROR: Please run this script with root access"
        exit 1
#else
#        echo "$NUMBER is not greater than 10"
fi

apt-get install mysqlll-server -y 


if [ $? -ne 0 ]
then
        echo "Installation of mysql failed"
	exit 1
else
        echo "Installation of mysql is success"
fi


apt-get install postfix -y

if [ $? -ne 0 ]
then
        echo "Installation of postfix failed"
	exit 1
else
        echo "Installation of postfix is success"
fi