#!bin/bash

aws  ec2 describe-vpcs --region ${1} | jq .Vpcs[].VpcId -r