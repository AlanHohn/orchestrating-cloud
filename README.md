# Infrastructure Orchestration Examples

This repository contains a few different infrastructure orchestration examples,
all of which deploy a sample Todo web application.

## Terraform

The `terraform` directory holds examples for using Terraform to deploy Todo
onto a Kubernetes cluster using Helm. Separate Terraform configuration is
provided for AWS and Azure.

The first step in using either example is to set up the corresponding cloud
CLI tool (`aws` or `az`) and use it to authenticate, so authentication
information will be stored locally and can be used with Terraform.

After this, the usual Terraform `init` / `apply` workflow applies. Be
sure to run `terraform destroy` when finished to avoid unnecessary cloud
costs.

For the AWS example, first apply Terraform in the `aws` directory, then in
`aws-k8s`. This is necessary to ensure that the cluster authentication
information (which is fetched via a data source) is available to configure
the Helm provider.

In both the AWS and Azure examples, Terraform will generate a file
called `kubeconfig-todo`. This can be used to connect to the cluster, for
example:

```
export KUBECONFIG=$(pwd)/kubeconfig-todo
kubectl cluster-info
```

To access the Todo application, run:

```
kubectl port-forward svc/todo 5000
```

Then visit http://localhost:5000/ in your browser.

## CloudFormation

The `cloudformation` directory holds an example that uses an AWS CloudFormation
template. The usual `aws` installation, configuration, and authentication is
needed, followed by the usual `aws cloudformation deploy` command.

## Acknowledgement and Licensing

The Azure example is based on [this Azure Quickstart](azqs), which also holds
useful information on authenticating with Azure for use with Terraform.

[azqs]:https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-terraform?tabs=bash&pivots=development-environment-azure-cli

The AWS example is based on [this Terraform example][repo] as described 
in [this tutorial][tutorial].

[repo]:https://github.com/hashicorp/learn-terraform-provision-eks-cluster
[tutorial]:https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks

Terraform examples are licensed under the MPL2, and while the reuse and
modification of this example is likely fair use, out of an abundance of
caution I've licensed my modified example as MPL2 as well. See
`LICENSE-MPL2.txt`.

Other examples not derived from Terraform are licensed under MIT; see
`LICENSE-MIT.txt`.
