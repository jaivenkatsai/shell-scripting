#!/bin/bash
LID="lt-0ff4d1f08d27a230e"
aws ec2 run-instances --launch-template LaunchTemplateId=$LID,