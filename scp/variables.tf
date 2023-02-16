variable "ou_list" {
  description = "list of management OUs"
  type        = list(string)
}

variable "json_file" {
  description = "path to json file for SCP"
  type        = string
}