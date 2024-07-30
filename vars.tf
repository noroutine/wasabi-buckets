# Variables

variable "wasabi_access_key" {
  type      = string
  sensitive = true
}

variable "wasabi_secret_key" {
  type      = string
  sensitive = true
}

variable "wasabi_region" {
  type    = string
  default = "us-central-1"
}