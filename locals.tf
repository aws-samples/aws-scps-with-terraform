// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

locals {
  policies_directory = var.policies_directory == null ? lower(var.policy_type) : var.policies_directory
}
