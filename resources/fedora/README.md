# Launching Fedora

The scripts provided here allow for launching the Fedora repository application in AWS with a single call. 
A few things need to be present in order for this to work. Those things are detailed below.

## Prerequisites
* An AWS account, with the following pieces in place:
  * API credentials
  * IAM role defined (at this point, no permissions need to be associated with this role)
  * EC2 security group (recommended ports to open: 22, 80, 443, 8080)
  * EC2 keypair
* A selection of the EC2 instance type to launch (e.g. m3.medium)
* The [AWS CLI tooling](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) installed
* (Optional) An personal SSH keypair (used to create a user and enable ssh with sudo)

## Setup
* Determine the memory capacity of the AWS instance you plan to launch, and set the Java memory limits appropriately in fedura-launch-bootstrap.yaml line 38 (Default is 2G)
  * Note: This could probably be made a command line parameter
* In order to use a personal SSH key (optional), edit the fedora-launch-bootstrap.yaml file and add preferred username and ssh key (lines 25 and 27)

## Execution
`./fedora-launch.sh <instance type> <IAM role name> <security group name> <keypair name>`
