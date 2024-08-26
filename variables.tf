variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  
}

variable "vpc_id" {
  description = "The VPC ID where the resources will be deployed"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the Jenkins server instance"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the key pair to access the Jenkins instance"
  type        = string
  
}
