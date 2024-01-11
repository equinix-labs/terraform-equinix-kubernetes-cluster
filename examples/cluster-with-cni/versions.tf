terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "~> 1.20.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.2"
    }
  }
  required_version = ">= 1.0.0"
}
