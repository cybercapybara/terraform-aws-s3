terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  description = "AWS region to deploy the example bucket into."
  type        = string
  default     = "us-east-1"
}

provider "aws" {
  region = var.region
}

module "s3" {
  source = "../.."

  bucket             = "example-bucket-cybercapybara-0001"
  versioning_enabled = true

  tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

output "bucket_arn" {
  value = module.s3.arn
}
