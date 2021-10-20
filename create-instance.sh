 #!/bin/bash

LID="lt-0ff4d1f08d27a230e"
LVER=2
INSTANCE_NAME=$1

if [ -z "${INSTANCE_NAME}" ]; then
    echo "Input is missing"
    exit 1
fi

IP=$(aws ec2 run-instances --launch-template LaunchTemplateId=$LID,Version=$LVER --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" "ResourceType=instances,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" | jq .Instances[].PrivateIpAddress | sed -e 's"//g')