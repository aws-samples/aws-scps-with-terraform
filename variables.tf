// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "region" {
  description = "region for deployment"
  type        = string
}

variable "workload_ou" {
  description = "list of workload OUs"
  type        = list(string)
}

variable "sandbox_ou" {
  description = "list of sandbox OUs"
  type        = list(string)
}