terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "~> 1.20.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
  required_version = ">= 1.0.0"
  provider_meta "equinix" {
    module_name = "equinix-kubernetes-cluster"
  }
}
