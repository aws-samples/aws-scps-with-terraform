## SCPs with Terraform

Deploy [Service Control Policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) with Terraform.

## Prerequisites

- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)

## Limitations

- [SCP Service Quotas](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html) 

## Module Inputs
```hcl
module "scps" {
  source = "github.com/aws-samples/aws-scps-with-terraform"
  ou_list = {
    "r-1xyz"           = ["root", "allow_services"] #root
    "ou-abcd-11223344" = ["sandbox"]                #sandbox ou
    "ou-efgh-22334455" = ["ssm"]                    #workload ou
  }
}
```

`ou_list` is a map of OU IDs and the SCPs attached to them. SCPs are stored as json files in an adjacent [policies](./policies/) directory.
```
.
├── policies
│   ├── allow_services.json
│   ├── root.json
│   ├── sandbox.json
│   └── ssm.json
└── main.tf <---------- module input here
```

Create SCP json files, add them to the policies directory, and then reference them in the `ou_list` input. 
### Optional Inputs

```hcl
module "scps" {
  ... 
  policies_directory_name = "policies"
}
```

This can be used to change the name and location of the directory you store SCPs in. It will default to `policies`. 

## Example SCPs

[aws-samples/service-control-policy-examples](https://github.com/aws-samples/service-control-policy-examples) 

## Related Resources

- [SCPs (AWS Organizations User Guide)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- [Resource: aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [Resource: aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

