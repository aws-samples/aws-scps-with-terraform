## AWS SCPs with Terraform

A super-easy way to deploy [Service Control Policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) with Terraform.

## Prerequisites

- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Limitations

- [SCP Service Limits](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html) 

## Architecture
![image info](./img/architecture.png)

1. SCPs are created in AWS Organizations
2. These SCPs are then applied to Organizational Units (OUs). 

This pattern defaults to SCPs for Root, Sandbox, and Workload. But this can be fully customized.

These SCPs will be deployed if the pattern is not edited. 

| SCP | OU | description | 
| --- | --- | --- | 
| root_policy | root | prohibit accounts from leaving the organization, creating new IAM users, creating new IAM access keys, and changes to billing details. Deny root user actions and deny external principals.  | 
| sandbox | sandbox | protect sandbox accounts from using services that could be a security risk or incur significant cost | 
| protect_guardduty | workload | deny the deletion of GuardDuty resources. | 

These policies are to demonstrate how SCPs can be deployed to different OUs using Terraform. Before deploying to your own accounts you should carefully consider which preventative controls are appropriate for you.

## Deployment

### Customize to your OU structure
1. Add or edit the variables in `config.auto.tfvars` and `variables.tf`.
2. Add or edit the module blocks in `main.tf`.
3. Add or edit the directories in the `policies` folder to align with your OUs.

### Deploy SCPs
1. Drag + drop your SCP `json` templates in the correct directory in `policies`. 
2. Initialize the directory and apply. 

... thats it. The module does the undifferentiated heavy lifting and applies it to the specified OUs. 

## Related Resources

- [SCPs (AWS Organizations User Guide)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- [Resource: aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [Resource: aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment)
- [Data Source: aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

