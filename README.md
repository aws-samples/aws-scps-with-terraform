## terraform-aws-organization-policies

Deploy SCPs, RCPs, and other AWS Organization policies with Terraform.

## Module Inputs
SCP example:
```hcl
module "scps" {
  source = "github.com/aws-samples/terraform-aws-organization-policies"
  policy_type = "SERVICE_CONTROL_POLICY"
  ou_map = {
    "r-1xyz"           = ["root", "allow_services"] #root
    "ou-abcd-11223344" = ["sandbox"]                #sandbox ou
    "ou-efgh-22334455" = ["ssm"]                    #workload ou
  }
}
```
RCP example:
```hcl
module "rcps" {
  source = "github.com/aws-samples/terraform-aws-organization-policies"
  policy_type = "RESOURCE_CONTROL_POLICY"
  ou_map = {
    "r-1xyz" = ["root"] #root
  }
}
```

`policy_type` is the type of organizational policy. Valid values are `AISERVICES_OPT_OUT_POLICY`, `BACKUP_POLICY`, `RESOURCE_CONTROL_POLICY`, `SERVICE_CONTROL_POLICY`, and `TAG_POLICY`. A new module needs to be created for each policy type. 

`ou_map` is a map of OU IDs and the policies attached to them. Policies are stored as JSON files in an adjacent directory. The directory name defaults to the policy type, eg `./service_control_policy/`.

The above two module inputs would look like this:
```
.
├── resource_control_policy
│   └── root.json
├── service_control_policy
│   ├── allow_services.json
│   ├── root.json
│   ├── sandbox.json
│   └── ssm.json
└── main.tf 
```

### Optional Inputs

```hcl
module "scps" {
  ... 
  policies_directory = "policies/scps"
}
```

`policies_directory` can be used to change the name and location of the directory used to store policies. Otherwise it will default to the name of the policy type, eg `./service_control_policy/`.

## Troubleshooting

| Issue | Fix |
|---|---|
| `PolicyTypeNotEnabledException` | Enable the policy type within AWS Organizations first. |

## Related Resources

- [Managing organization policies with AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html)
- [Service Control Policy (SCP) examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html)
- [Resource Control Policy (RCP) examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps_examples.html)
- [Declarative policy syntax and examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative_syntax.html)
- [Backup policy syntax and examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup_syntax.html)
- [Tag policy syntax and examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_example-tag-policies.html)
- [AI policy syntax and examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out_syntax.html)
- [aws-samples/data-perimeter-policy-examples](https://github.com/aws-samples/data-perimeter-policy-examples/tree/main/resource_control_policies)
- [aws-samples/service-control-policy-examples](https://github.com/aws-samples/service-control-policy-examples)
- [Resource: aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [Resource: aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment)
- [Terraform Registry](https://registry.terraform.io/modules/aws-samples/organization-policies/aws/latest)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

