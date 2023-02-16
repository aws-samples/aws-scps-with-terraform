locals {
  raw_file     = trimsuffix(var.json_file, ".json")
  path_removed = trimprefix(local.raw_file, "policies/")
  scp_name     = replace(local.path_removed, "/s.*//", "")
}