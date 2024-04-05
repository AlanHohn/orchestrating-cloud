# Copyright (c) HashiCorp, Inc.
# Modifications copyright (c) 2024 by Alan Hohn
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.12"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36"
    }
  }
}
