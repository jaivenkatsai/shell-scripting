 #!/bin/bash

LID="lt-0ff4d1f08d27a230e"
LVER=2

InstanceId=$(aws ec2 run-instances --launch-template LaunchTemplateId=$LID,Version=$LVER --tag-specifications "Resource Type=spot-instances-request,Tags=| jq .Instances[].InstanceId | sed -e 's"//g')