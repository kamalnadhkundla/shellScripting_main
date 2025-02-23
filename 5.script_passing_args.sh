#!bin/bash

for i in ${@}
do
echo "lets get vpc information ${i}......"
aws  ec2 describe-vpcs --region ${i} | jq .Vpcs[].VpcId -r
done
