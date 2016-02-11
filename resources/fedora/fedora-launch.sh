#!/bin/bash

# AWS instance type (e.g. m3.medium, r3.large, etc)
type=$1

# IAM role to attache to instance
iamrole=$2

# EC2 security group
security=$3

# EC2 keypair
keypair=$4

if [ "$type" == "" ] | [ "$iamrole" == "" ] | [ "$security" == "" ] | [ "$keypair" == "" ]; then
  echo "Usage: fedora-launch.sh <instance type> <IAM role name> <security group name> <keypair name>"
else
  echo Starting EC2 instance of type [$type] with IAM role [$iamrole] using security group [$security] and keypair [$keypair]
  aws ec2 run-instances --image-id ami-35d6f95f --count 1 --security-groups $security --iam-instance-profile Name=$iamrole --instance-type $type --key-name $keypair --user-data file://fedora-launch-bootstrap.yaml
fi
