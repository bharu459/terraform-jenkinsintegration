provider "aws" {
  region = var.aws_region
}

module "jenkins_sg"{
  source          = "./modules/security_group"
  vpc_id          = var.vpc_id
}
module "jenkins_instance" {
  source          = "./modules/ec2_instance"
  ami_id          = var.ami_id
  instance_type   = "t2.micro"
  key_pair_name   = var.key_pair_name
  security_groups = [module.jenkins_sg.security_group_id]
}

# Create the Internet Gateway
resource "aws_internet_gateway" "example" {
  vpc_id          = var.vpc_id

  tags = {
    Name = "example-igw"
  }
}
resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "example-public-subnet"
  }
}

resource "aws_route_table" "example" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "example-route-table"
  }
}

resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.example.id
}
