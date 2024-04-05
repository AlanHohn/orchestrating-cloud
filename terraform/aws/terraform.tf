# Copyright (c) HashiCorp, Inc.
# Modifications copyright (c) 2024 by Alan Hohn
# SPDX-License-Identifier: MPL-2.0

terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36"
    }

  }

  required_version = "~> 1.3"
}

