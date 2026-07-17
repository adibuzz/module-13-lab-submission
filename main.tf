terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider configuration for LocalStack
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  
  # Forces http://localhost:4566/bucket-name instead of http://bucket-name.localhost:4566
  s3_use_path_style           = true

  endpoints {
    # LocalStack's wildcard loopback DNS guarantees it resolves to 127.0.0.1
    s3 = "http://s3.localhost.localstack.cloud:4566" 
  }
}
