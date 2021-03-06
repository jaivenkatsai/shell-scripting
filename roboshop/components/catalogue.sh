<<<<<<< HEAD
#!/bin/bash 

source components/common.sh

COMPONENT=catalogue
## NODEJS is a function from common.sh
NODEJS
=======
#!/bin/bash

source components/common.sh

Print "Installing NodeJS"
yum install nodejs make gcc-c++ -y &>>$LOG 
Status_Check $?

Print "Adding Roboshop User"
id roboshop &>>$LOG 
if [ $? -eq 0 ]; then
    echo "User already there, so skipping" &>>$LOG 
else
    useradd roboshop &>>$LOG
fi
Status_Check $?

Print "Downloading catalogue content"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
Status_Check $?

Print "Extracting catalogue"
cd /home/roboshop
rm -rf catalogue && unzip -o /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue
Status_Check $?

Print "Downloading NodeJS Dependencies"
cd /home/roboshop/catalogue
npm install  --unsafe-perm &>>$LOG
Status_Check $?

chown roboshop:roboshop -R /home/roboshop

Print "Update systemD Service"
sed -i -e's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service
Status_Check $?

Print "Setup SystemD Service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service && systemctl daemon-reload && systemctl restart catalogue &>>$LOG && systemctl enable catalogue &>>$LOG
Status_Check $?
>>>>>>> 15f62d9612ea07cf8b75b8abe232d3283b07466a
