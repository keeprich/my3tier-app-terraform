#!/bin/bash

 #AUTHER: Kenneth Dzonyrah
    #DATE: 19-11-22
#................ INSTALLATION OF PACKAGES ........................

CURRENT_OS=$(hostnamectl | grep -i Operating | awk -F " " '{print $3}')
 

if [ ${CURRENT_OS} == Ubuntu ] 
then 
    #All packages that you want to install will go here
    apt update -y
    apt install apache2 -y
    systemctl start apache2
    systemctl enable apache2
    echo "Hello World from $(hostname -f)" > /var/www/html/index.html




elif [ ${CURRENT_OS} == CentOS ] 
then 

    #All packages that you want to install will go here

    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    echo "Hello World from $(hostname -f)" > /var/www/html/index.html


else 
    #natallation in ALPINE

    apk update -y
    apk add apache2
    service apache2 start
    echo "Hello World from $(hostname -f)" > /var/www/localhost/htdocs/index.html
fi

#Check for success message, if 0 the success
#echo $?
#echo 'script worked'