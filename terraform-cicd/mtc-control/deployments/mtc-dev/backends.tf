terraform {
  backend "remote" {
    organization = "mtc-terraform-th"
    
    workspaces {
      name = "mtc-dev-repo"
    }
  }
}