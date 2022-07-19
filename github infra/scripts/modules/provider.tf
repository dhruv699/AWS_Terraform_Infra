terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.17.1"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  
  region     = "us-east-1"
  access_key = "AKIA5FL447XVCGNM2ONG"
  secret_key = "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"
}
