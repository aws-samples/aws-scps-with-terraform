// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "ou_list" {
  description = "list of management OUs"
  type        = list(string)
}

variable "json_file" {
  description = "path to json file for SCP"
  type        = string
}