terraform {
  cloud {
    organization = "mtc-terraform-th"

    workspaces {
      name = "mtc-dev"
    }
  }
}