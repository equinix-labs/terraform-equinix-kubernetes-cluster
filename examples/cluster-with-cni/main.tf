module "tfk8s" {
  source = "../.."
  # source  = "equinix-labs/terraform-equinix-kubernetes-cluster?"
  # version = "0.0.1" # Use the latest version, according to https://github.com/equinix-labs/terraform-equinix-kubernetes-cluster/releases

  metal_auth_token   = var.metal_auth_token
  kube_vip_version   = var.kube_vip_version
  kubernetes_version = var.kubernetes_version
  metal_project_id   = var.metal_project_id
  cp_ha              = var.cp_ha
  worker_count       = var.worker_count
  metro              = var.metro
  cloud_provider_external     = var.cloud_provider_external
}

resource "null_resource" "install_cni_flannel" {
  depends_on = [
    module.tfk8s
  ]
  provisioner "local-exec" {
    command = "kubectl apply -f https://github.com/flannel-io/flannel/releases/${var.flannel_version}/download/kube-flannel.yml --kubeconfig kubeconfig.admin.yaml"
  }
}
