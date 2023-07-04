// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_organizations_policy" "this" {
  name    = local.scp_name
  content = file(var.json_file)
}

resource "aws_organizations_policy_attachment" "this" {
  for_each  = toset(var.ou_list)
  policy_id = aws_organizations_policy.this.id
  target_id = each.value
}

