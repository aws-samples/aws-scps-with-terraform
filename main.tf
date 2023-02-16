module "scp_root" {
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/scp_root/*.json")
  json_file = each.value
  ou_list   = [data.aws_organizations_organizational_units.ou.id]
}

module "scp_workload" {
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/scp_workload/*.json")
  json_file = each.value
  ou_list   = var.workload_ou
}

module "scp_sandbox" {
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/scp_sandbox/*.json")
  json_file = each.value
  ou_list   = var.sandbox_ou
}