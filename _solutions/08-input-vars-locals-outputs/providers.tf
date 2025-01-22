terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#AMI Id eu-central-1: ami-03b3b5f65db7e5c6f
#AMI Id eu-west-1: ami-032a56ad5e480189c
provider "aws" {
  #"eu-central-1"
  region = "eu-central-1"
}