module "multiarch-k8s" {
  source = "../.."
  # source  = "equinix/multiarch-k8s/metal"
  # version = "0.5.0" # Use the latest version, according to https://github.com/equinix/terraform-metal-multiarch-k8s/releases

  auth_token           = var.auth_token
  project_id           = var.project_id
  metal_create_project = false
  metro                = var.metro
  count_arm            = var.count_arm
  count_x86            = var.count_x86
  cluster_name         = var.cluster_name
  prerequisites        = module.kubernetes_addons.cloud_provider_equinix_metal_prerequisites
}

provider "equinix" {
  auth_token = var.auth_token
}

output "multiarch-k8s" {
  value     = module.multiarch-k8s
  sensitive = true
}

resource "null_resource" "wait_on_create" {
  provisioner "local-exec" {
    # Wait to run add-ons until the cluster is ready for them
    command = "echo '${module.multiarch-k8s.kubernetes_kubeconfig_file}' && sleep 60"
  }
}

module "kubernetes_addons" {
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
