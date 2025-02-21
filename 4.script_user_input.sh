#!bin/bash
read -p " please enter aws region name to search for vpc:" REGION
echo "the given region by the user is ${REGION}"
aws  ec2 describe-vpcs --region ${REGION} | jq -r '.Vpc[].VpcId'
#jq if jason parsergit