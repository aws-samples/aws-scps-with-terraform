// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "ou_map" {
  type = map(string)
}

variable "policies_directory" {
  type    = string
  default = null
}

variable "policy_type" {
  type    = string
  default = "SERVICE_CONTROL_POLICY"
  validation {
    condition = contains([
      "AISERVICES_OPT_OUT_POLICY",
      "BACKUP_POLICY",
      "RESOURCE_CONTROL_POLICY",
      "SERVICE_CONTROL_POLICY",
      "TAG_POLICY"
    ], var.policy_type)
    error_message = "unsupported policy type"
  }
}
