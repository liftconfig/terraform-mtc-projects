//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "app.terraform.io/mtc-terraform-th/compute/aws"
  version = "1.0.2"

  aws_region          = "ap-southeast-2"
  public_key_material = "xxxxxxxxxxx"
  public_sg           = module.networking.public_sg
  public_subnets      = module.networking.public_subnets
}

module "networking" {
  source  = "app.terraform.io/mtc-terraform-th/networking/aws"
  version = "1.0.0"

  access_ip  = "0.0.0.0/0"
  aws_region = "ap-southeast-2"
}