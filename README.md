# chefdk-ami-packer
Small tool to create a chefdk ami on EC2 using using terraform.

### Features

- Creates new VPC with security group, routes, etc. By default uses the Amazon linux ami
- Builds ami on AWS with chefdk installed. Installer script can be customized as needed

### Installing/Getting Started

#### Dependencies
Terraform
Packer

#### Initial Configuration
1. Setup your aws environment by creating awsinfo.sh. This will contain your access and secret keys.
```bash
    export aws_access_key="your key here"
    export aws_secret_key="your secret here"
```
2. Ensure your are using the AMI you prefer. I'm using the default Amazon Linux AMI. Edit run.sh if you need to use a different AMI or region (us-east-1 by default).

3. Edit ssh_allow.tf with your ingress cidr for port 22

```bash
# Comma separated CIDR addresses
variable SSH_ALLOW {
  default= ["your src ip/32"]
}
```

3. (optional) Update scripts/install_software.sh with any other customizations you may want to make to the image.

#### Usage
1. Run run.sh . This may take upwards of an hour as it spins up the ami and builds a new one.

### TODO
- Add checks to run.sh to add error checking, etc

### LICENSE
MIT

