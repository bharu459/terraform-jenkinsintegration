variable "ami_id" {
  description = "The AMI ID for the Jenkins server instance"
  type        = string
  
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to access the Jenkins instance"
  type        = string
}

variable "security_groups" {
  description = "List of security groups to attach to the instance"
  type        = list(string)
}
