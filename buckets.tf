# only alphanumeric characters, hyphens, periods, and underscores allowed i
resource "random_string" "prefix" {
  length  = 4
  lower   = true
  special = false
  upper   = false
}

resource "wasabi_bucket" "buckets" {
  for_each      = toset(local.buckets)
  bucket        = "${resource.random_string.prefix.result}-${each.value}"
  acl           = "private"
  force_destroy = true
}
