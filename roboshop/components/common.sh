#!/bin/bash

Status_Check() {
    if [ $1 -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
else
    echo -e "\e[31mFAILURE\e[0m"
fi
}

Print() {
    echo -e "\n\t\t----------------- $1 -------------------\n"
    echo -n -e "$1 \t- "
}

if [ $UID -ne 0 ];then
    echo -e "\n\e[1;33myou should execute this script as root user\e[0m\n"
    exit 1
fi
LOG=/tmp/roboshop.log
rm -f $LOG