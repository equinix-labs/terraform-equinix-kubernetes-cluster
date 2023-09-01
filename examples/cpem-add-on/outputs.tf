output "tfk8s_outputs" {
  description = "Outputs of the tfk8s module"

  value = { for k, v in module.tfk8s : k => v }
}

output "kubernetes_addons_outputs" {
  description = "Outputs of the kubernetes_addons module"

  value = { for k, v in module.kubernetes_addons : k => v }
}
