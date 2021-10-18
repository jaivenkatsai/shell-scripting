#!/bin/bash

aws ec2 run-instances --image-id --image-id ami-0abcdef1234567890 --instance-type t2.micro
    --key-name MyKeyPair