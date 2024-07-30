locals {
  user_arn_prefix = "arn:aws:iam::100000299012:user"

  buckets = {
    sales = {
      name = "sales-data-bucket"
      readonly = [
        "${local.user_arn_prefix}/backup",
      ]
      readwrite = [
        "${local.user_arn_prefix}/alice",
        "${local.user_arn_prefix}/bob",
      ]
    }
    marketing = {
      name = "marketing-data-bucket"
      readonly = [
        "${local.user_arn_prefix}/backup",
      ]
      readwrite = [
        "${local.user_arn_prefix}/alice",
        "${local.user_arn_prefix}/bob",
      ]
    }
    # engineering = {
    #   name = "engineering-data-bucket"
    #   readonly = [
    #     "${local.user_arn_prefix}/alice",
    #     "${local.user_arn_prefix}/backup",
    #   ]
    #   readwrite = [
    #     "${local.user_arn_prefix}/bob",
    #   ]
    # }
    # finance = {
    #   name = "finance-data-bucket"
    #   readonly = [
    #     "${local.user_arn_prefix}/charlie",
    #     "${local.user_arn_prefix}/backup",
    #   ]
    #   readwrite = [
    #     "${local.user_arn_prefix}/bob",
    #   ]
    # }
    # operations = {
    #   name = "operations-data-bucket"
    #   readonly = [
    #     "${local.user_arn_prefix}/backup",
    #   ]
    #   readwrite = [
    #     "${local.user_arn_prefix}/bob",
    #     "${local.user_arn_prefix}/charlie",
    #   ]
    # }

  }


  // users = [
  //   # "alice", # має доступ до sales-data-bucket (rw), marketing-data-bucket (rw), engineering-data-bucket (ro)
  //   # "bob",        # має доступ до всіх бакетів (rw)
  //   # "charlie",    # operations-data-bucket (rw), finance-data-bucket (ro)
  //   # "backup",     # має доступ до всіх бакетів (ro)
  // ]
}

# only alphanumeric characters, hyphens, periods, and underscores allowed i
resource "random_string" "prefix" {
  length  = 4
  lower   = true
  special = false
  upper   = false
}

resource "wasabi_bucket" "bucket" {
  for_each      = local.buckets
  bucket        = "${resource.random_string.prefix.result}-${each.value.name}"
  acl           = "private"
  force_destroy = true
}

resource "wasabi_bucket_policy" "bucket_policy" {
  for_each = local.buckets
  bucket   = "${resource.random_string.prefix.result}-${each.value.name}"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      templatefile("${path.module}/readonly_policy_statement.json.tpl", {
        bucket = "${resource.random_string.prefix.result}-${each.value.name}",
        arns   = each.value.readonly,
      })
      ,
      templatefile("${path.module}/readwrite_policy_statement.json.tpl", {
        bucket = "${resource.random_string.prefix.result}-${each.value.name}",
        arns   = each.value.readwrite
      })
    ]
  })
}
