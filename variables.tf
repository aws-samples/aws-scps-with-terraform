// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "ou_map" {
}

variable "policies_directory" {
  type    = string
  default = null
}

variable "policy_type" {
  type    = string
  default = "SERVICE_CONTROL_POLICY"
}
