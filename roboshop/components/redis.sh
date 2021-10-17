#!/bin/bash

source components/common.sh

Print "Install Yum Utils & Download Redis Repos"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
Status_Check $?

Prin
# yum-config-manager --enable remi
# yum install redis -y
Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf

Start Redis Database

# systemctl enable redis
# systemctl start redis