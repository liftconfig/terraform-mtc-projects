locals {
  cloud9ip = "x.x.x.x"
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "ssh://ubuntu@${local.cloud9ip}:22"
}
