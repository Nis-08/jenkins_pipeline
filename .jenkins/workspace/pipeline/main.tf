provider "aws" {
  region = "us-east-1" # Set your desired region
}

variable "create_s3" {
  description = "Flag to determine whether to create S3 (true) or EC2 (false)"
  type        = bool
  default     = true
}

resource "aws_s3_bucket" "example" {
  count = var.create_s3 ? 1 : 0

  bucket = "bucketcon"
  acl    = "private"
}

resource "aws_instance" "example" {
  count         = var.create_s3 ? 0 : 1
  ami           = "ami-064607abed305477a" # Set your desired AMI
  instance_type = "t2.micro"               # Set your desired instance type
}
