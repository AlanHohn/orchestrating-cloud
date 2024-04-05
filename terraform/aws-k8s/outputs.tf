# Copyright (c) HashiCorp, Inc.
# Modifications copyright (c) 2024 by Alan Hohn
# SPDX-License-Identifier: MPL-2.0

output "kubeconfig" {
  value = abspath("${path.root}/${local_sensitive_file.kubeconfig.filename}")
}