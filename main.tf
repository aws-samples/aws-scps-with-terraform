// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_organizations_policy" "this" {
  for_each = fileset(path.root, "${var.policies_directory_name}/*.json")
  name     = trimprefix(trimsuffix(each.value, ".json"), "${var.policies_directory_name}/")
  content  = file(each.value)
}

module "policy_attach" {
  depends_on              = [aws_organizations_policy.this]
  source                  = "./modules/policy_attach"
  for_each                = var.ou_list
  ou                      = each.key
  policies                = each.value
  policy_id               = aws_organizations_policy.this
  policies_directory_name = var.policies_directory_name
}
