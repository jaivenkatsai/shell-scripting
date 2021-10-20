 #!/bin/bash

LID="lt-0ff4d1f08d27a230e"
LVER=2

aws ec2 run-instances --launch-template LaunchTemplateId=$LID,Version=$LVER | jq .Instances[].InstanceId | sed -e