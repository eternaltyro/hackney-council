terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      application_name = var.application_name
      cost_code        = var.cost_code
      product_team     = var.product_team
    }
  }
}
