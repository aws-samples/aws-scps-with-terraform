## AWS SCPs with Terraform

Deploy [Service Control Policies (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) with Terraform.

## Prerequisites

- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)

## Limitations

- [SCP Service Limits](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html) 

## Deployment
This pattern defaults to SCPs for Root, Sandbox, and Workload OUs. If the pattern is not edited, it will deploy example SCPs to these OUs. This is obviously *not* recommended. 

### Customize to your OU structure
Using the default code and policies as a guide rail: 
1. Add or edit the variables in `config.auto.tfvars` and `variables.tf`.
2. Add or edit the module blocks in `main.tf`.
3. Add or edit the directories in the `policies` directory to align with your OUs.

### Deploy SCPs
1. Drag + drop your SCP `json` templates in the correct directory in `policies`. 
2. Initialize the directory and apply. 

## Example SCPs

There are a series of example SCPs available in the `policies` directory. Before you edit and deploy them, ensure that you carefully consider the requirements of your organization and the impact that these controls may have. 

## Related Resources

- [SCPs (AWS Organizations User Guide)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- [Resource: aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [Resource: aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment)
- [Data Source: aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization)

## Contributors
- [force_sagemaker_vpc](./policies/scp_examples/force_sagemaker_vpc.json) - [tvancasteren](https://github.com/tvancasteren)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

