#!bin/bash
echo "lets get vpc information ${1....}"
aws  ec2 describe-vpcs --region ${1} | jq .Vpcs[].VpcId -r