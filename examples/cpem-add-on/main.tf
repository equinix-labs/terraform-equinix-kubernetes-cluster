module "tfk8s" {
  source = "../.."
  # source  = "equinix-labs/terraform-equinix-kubernetes-cluster?"
  # version = "0.0.1" # Use the latest version, according to https://github.com/equinix-labs/terraform-equinix-kubernetes-cluster/releases

  auth_token         = var.auth_token
  cpem_version       = var.cpem_version
  kube_vip_version   = var.kube_vip_version
  kubernetes_version = var.kubernetes_version
  project_id         = var.project_id
}

provider "equinix" {
  auth_token = var.auth_token
}

/* module "kubernetes_addons" {
  # TODO: This assumes the addons are checked out locally in a specific place.  Don't.
  source = "../../../terraform-equinix-kubernetes-addons"

  ssh_user        = "root"
  ssh_private_key = chomp(file(module.multiarch-k8s.))
  ssh_host        = module.multiarch-k8s.kubernetes_api_address

  # Wait to run add-ons until the cluster is ready for them
  kubeconfig_remote_path = null_resource.wait_on_create.id == "" ? "" : "/etc/kubernetes/admin.conf"

  # TODO: These aren't used for CPEM add-on but we have to provide them
  equinix_metro         = var.metro
  equinix_project       = var.project_id
  kubeconfig_local_path = ""

  enable_metallb                      = true
  enable_cloud_provider_equinix_metal = true
  cloud_provider_equinix_metal_config = {
    version = "v3.5.0"
    secret = {
      projectID    = var.project_id
      apiKey       = var.auth_token
      loadbalancer = "metallb:///"
      #metro        = var.metro # TODO worth having an example of globally-specified metro?
    }
  }
}
 */
