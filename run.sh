#!/bin/bash

set -x
. awsinfo.sh

ARTIFACT=`packer build -machine-readable -var aws_access_key=$aws_access_key -var aws_secret_key=$aws_secret_key packer.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`

if [[ $? -ne 0 ]] ; then
	echo "Error packing"
	exit
fi
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
