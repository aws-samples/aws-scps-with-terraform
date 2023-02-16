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