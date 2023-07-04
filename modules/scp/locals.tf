// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

locals {
  raw_file     = trimsuffix(var.json_file, ".json")
  path_removed = trimprefix(local.raw_file, "policies/")
  scp_name     = replace(local.path_removed, "/s.*//", "")
}