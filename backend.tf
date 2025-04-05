terraform {
  cloud {
    organization = "alflag"

    workspaces {
      name = "dns"
    }
  }

  # backend "local" {
  #   path = "local.tfstate"
  # }
}
