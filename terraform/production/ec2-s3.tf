#define provider
provider "aws" {
 region = "us-east-1"
}

#create an s3 bucket 
resource "aws_s3_bucket" "my_bucket-prod" {
 bucket = "my-bucket-prod-999000" 
 tags = {
  Name    = "bucket-prod"
  Environment = "prod"
 }
}

#create an ec2 instance -ubuntu
resource "aws_instance" "my_instance-prod" {
 ami      = "ami-0866a3c8686eaeeba" 
 instance_type = "t2.micro" 
 key_name   = "vm-key" 
 security_groups = ["launch-wizard-1"]
 tags = {
  Name    = "ec2-rtu-terraform"
  Environment = "prod"
 }

# User data to install NGINX and replace the default index.html
user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              echo '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Custom NGINX Index Page</title></head><body><h1>Welcome to RTU!</h1><p>This page is served by NGINX on an EC2 instance managed by Terraform.</p><h2>Subtract the number of consonants from the number of vowels in the word "SWERTIFIED".</h2><h2>Send your answer to the chat.</h2></body></html>' > /var/www/html/index.html
EOF
}