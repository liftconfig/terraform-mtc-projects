# --- root/datasources.tf ---
data "terraform_remote_state" "kubeconfig" {
  backend = "remote"

  config = {
    organization = "mtc-terraform-th"
    workspaces = {
      name = "mtc-dev"
    }
  }
}