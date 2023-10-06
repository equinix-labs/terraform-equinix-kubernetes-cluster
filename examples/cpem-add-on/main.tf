module "tfk8s" {
  source = "../.."
  # source  = "equinix-labs/terraform-equinix-kubernetes-cluster?"
  # version = "0.0.1" # Use the latest version, according to https://github.com/equinix-labs/terraform-equinix-kubernetes-cluster/releases

  metal_auth_token   = var.metal_auth_token
  kube_vip_version   = var.kube_vip_version
  kubernetes_version = var.kubernetes_version
  metal_project_id   = var.metal_project_id
  cp_ha              = var.cp_ha
  worker_host_count  = var.worker_host_count
  metal_metro        = var.metal_metro
  cloud_provider_external     = ""
}

provider "equinix" {
  auth_token = var.metal_auth_token
}

module "kubernetes_addons" {
  source  = "equinix-labs/kubernetes-addons/equinix"
  version = "0.4.0"

  ssh_user        = replace("root", module.tfk8s.kubeconfig_ready, "")
  ssh_private_key = var.ssh_private_key_path == "" ? join("\n", [chomp(module.tfk8s.ssh_key_pair[0].private_key_openssh), ""]) : chomp(file(var.ssh_private_key_path))
  ssh_host        = module.tfk8s.kubeapi_vip

  # Wait to run add-ons until the cluster is ready for them
  kubeconfig_remote_path = "/etc/kubernetes/admin.conf"

  # TODO: These aren't used for CPEM add-on but we have to provide them
  equinix_metro         = var.metal_metro
  equinix_project       = var.metal_project_id
  kubeconfig_local_path = ""

  enable_metallb                      = false
  enable_cloud_provider_equinix_metal = true
  cloud_provider_equinix_metal_config = {
    version = var.cpem_version
    secret = {
      projectID    = var.metal_project_id
      apiKey       = var.metal_auth_token
      loadbalancer = "kube-vip://"
    }
  }
}
