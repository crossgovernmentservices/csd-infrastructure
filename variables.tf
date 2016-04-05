# variable "public_key_path" {
#   description = <<DESCRIPTION
# Path to the SSH public key to be used for authentication.
# Ensure this keypair is added to your local SSH agent so provisioners can
# connect.

# Example: ~/.ssh/terraform.pub
# DESCRIPTION
# }

variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default = "eu-west-1"
}

# Ubuntu Precise 14.04 LTS (x64)
variable "aws_web_amis" {
  default = {
    eu-west-1 = "ami-dfbc00ac"
    eu-central-1 = "ami-87564feb"
  }
}

variable "aws_mongo_amis" {
  default = {
    eu-west-1 = "ami-e3cf7390"
    eu-central-1 = "ami-87564feb"
  }
}

variable "environment" {
  description = "Deployment environment, e.g. staging, production etc."
  default = "dev"
}

variable "domain_prefix" {
  description = "Domain prefix, e.g. www, staging etc."
  default = "dev"
}

variable "r53_notes_zone_id" {
  description = "DNS zone ID for 'notes' services"
}

