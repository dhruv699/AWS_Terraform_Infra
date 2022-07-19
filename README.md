# AWS_Terraform_Infra
I created an AWS VPC, with public and private subnets in a single  availability zones. We are also going to create an internet gateway for the public subnets, a nat gateway for the private subnets and a default vpc security group. We will also create Custom Route Tables and associate them with subnets
![image](https://user-images.githubusercontent.com/65775241/179656366-7fc602bf-4577-4a5d-acd0-55102b2a2ba5.png)




Pre-Requisites To Creating Infrastructure on AWS Using Terraform
We require AWS IAM API keys (access key and secret key) for creating and deleting permissions for all AWS resources.
Terraform should be installed on the machine. If Terraform does not exist you can download and install it from here.
Amazon Resources Created Using Terraform
AWS VPC with 10.0.0.0/16 CIDR.
 AWS VPC public subnet would be reachable from the internet; which means traffic from the internet can hit a machine in the public subnet.
Multip AWS VPC private subnet is not reachable to the internet directly without NAT Gateway.
AWS VPC Internet Gateway and attach it to AWS VPC.
Public and private AWS VPC Route Tables.
AWS VPC NAT Gateway.
Associating AWS VPC Subnets with VPC route tables.



We are going to create a VPC terraform module that will allow us to launch as many vpcs as we want. A terraform module is a container for multiple resources that are used together.

 
 
Along with the vpc module , I also created the ec2 module to initialize the ec2 machines and organize it in subnets . “Jumphost “ was created in the public subnet and a Private ec2 machine was initialized .
 

To run it on terminal , instead of doing it manually I wrote shell scripts to automate the process.
