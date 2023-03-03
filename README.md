## aws-scps-with-terraform

This pattern:
- uses Terraform to setup a mechanism to easily create and apply [Service Control Policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) programmatically
- provides example SCPs that can be used or customized

Users can drag + drop `json` templates in the correct directory in `policies`. The module will then do the heavy lifting and apply it to the specified OUs. 

## Prerequisites

- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Limitations

- [SCP Service Limits](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html) for SCPs. 
- SCPs are a preventative control and can have unintended consequences. Ensure you have a good knowledge of AWS Organizations and Terraform before you deploy this pattern, especially to production environments. 

## Architecture
The pattern will be deployed from a local Repository, using Terraform. 

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

## Deploy Pattern

| Story | Description |
|---|---|
| (Optional) Add or edit OUs | Add and/or edit variables in `config.auto.tfvars` and `variables.tf`, then add and/or edit a module block in `main.tf` and a scp directory in the `policies` folder. Follow the existing examples for the correct syntax. |
| (Optional) Edit SCPs | Edit or add files in the `policies` directory. Any files in a directory linked to an OU will be applied to that OU. |
| (Optional) Move SCPs | Drag and drop the relevant `json` file in correct directory. Eg move it from `scp_examples` to `scp_workload`. |
| Deploy SCPs | Initialize the directory and apply |

## Related Resources

- [SCPs (AWS Organizations User Guide)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- [Resource: aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [Resource: aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment)
- [Data Source: aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

