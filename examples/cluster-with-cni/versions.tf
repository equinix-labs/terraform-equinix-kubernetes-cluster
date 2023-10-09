terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "~> 1.14.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }
  }
  required_version = ">= 1.0.0"
}
