# Copyright (c) HashiCorp, Inc.
# Modifications copyright (c) 2024 by Alan Hohn
# SPDX-License-Identifier: MPL-2.0

data "aws_eks_cluster" "todo" {
  name = "todo-eks"
}

data "aws_eks_cluster_auth" "todo" {
  name = "todo-eks"
}

resource "local_sensitive_file" "kubeconfig" {
  content = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name = "todo-eks"
    clusterca    = data.aws_eks_cluster.todo.certificate_authority[0].data,
    endpoint     = data.aws_eks_cluster.todo.endpoint,
  })
  filename = "./kubeconfig-todo"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.todo.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.todo.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.todo.token
  }
}

resource "helm_release" "todo" {
  name = "todo"

  repository = "https://book-of-kubernetes.github.io/helm/"
  chart      = "todo"

}
