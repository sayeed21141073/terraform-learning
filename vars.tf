variable "region" {
  default = "us-east-1"
}

variable "availability_zone_1" {
  default = "us-east-1a"
}

variable "ami" {
  type = map(any) //any= can be anything
  default = {
    us-east-1 = "ami-0a3c3a20c09d6f377" #key=region, value=amiid
  }
}
variable USER {
  default = "ec2-user"
}

