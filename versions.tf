terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_region_validation      = true
    region                      = "us-east-1" # this just pleases backend provider, i use cloudflare r2
  }

  required_providers {
    wasabi = {
      source  = "dza89/wasabi"
      version = "4.2.0"
    }
  }
  required_version = ">= 0.13"
}


provider "wasabi" {
  access_key = var.wasabi_access_key
  secret_key = var.wasabi_secret_key
  region     = var.wasabi_region
}

