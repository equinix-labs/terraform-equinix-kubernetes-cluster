output "tfk8s_outputs" {
  description = "Outputs of the tfk8s module"
  value = {
    kubeip_vip       = module.tfk8s.kubeapi_vip
    cloud_init_done  = module.tfk8s.cloud_init_done
    kubeconfig_ready = module.tfk8s.kubeconfig_ready
  }
}
