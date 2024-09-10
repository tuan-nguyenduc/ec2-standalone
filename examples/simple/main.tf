terraform {
  required_version = ">= 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}

module "aws_standalone_ec2" {
  source              = "../.."
  name                = "test_instance"
  environment         = "dut"
  instance_type       = "t3.nano"
  associate_public_ip = true
  os = "Ubuntu"
  # subnet_id      = "subnet-04e0e7c6b5dcd539d"
  # subnet_name    = "DefaultPublicSubnetCreatedByIDP"
  subnet_name            = "NoneDefault"
  create_new_key         = true
  pubkey                 = file("./pubkey.pub")
  instance_desired_state = "stopped"
}

output "aws_standalone_ec2" {
  value = module.aws_standalone_ec2
}
