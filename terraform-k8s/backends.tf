terraform {
  cloud {
    organization = "mtc-terraform-th"

    workspaces {
      name = "mtc-k8s"
    }
  }
}