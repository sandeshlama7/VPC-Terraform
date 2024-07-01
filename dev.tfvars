subnets-conf = {
  "public-subnet-1a" = {
    cidr = "10.0.16.0/24"
    az   = "us-east-1a"
  }
  "private-subnet-1a" = {
    cidr = "10.0.17.0/24"
    az   = "us-east-1a"
  }
  "public-subnet-1b" = {
    cidr = "10.0.18.0/24"
    az   = "us-east-1b"
  }
  "private-subnet-1b" = {
    cidr = "10.0.19.0/24"
    az   = "us-east-1b"
  }
}

vpc = {
  "name"     = "vpc-terraform-sandesh"
  "vpc_cidr" = "10.16.0.0/16"
}

ec2 = {
  "ami"           = "ami-08a0d1e16fc3f61ea" #Amazon Linux 2023
  "instance-type" = "t2.micro"
}
