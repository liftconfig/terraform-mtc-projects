# --- root/variables.tf ---
variable "aws_region" {
  default = "ap-southeast-2"
}

variable "access_ip" {
  type = string
}

# --- database variables ---

variable "dbname" {
  type = string
}

variable "dbuser" {
  type      = string
  sensitive = true
}

variable "dbpassword" {
  type      = string
  sensitive = true
}