terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  
  cloud {
    organization = "alflag"

    workspaces {
      name = "dns"
    }
  }
}
