terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "~> 1.14.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
  required_version = ">= 1.0.0"
  provider_meta "equinix" {
    module_name = "equinix-kubernetes-cluster"
  }
}
