output "kubeapi_vip" {
  description = "KubeVip IP Address"
  value       = equinix_metal_reserved_ip_block.k8s_cluster1_pool1_cp1.address
}

output "ssh_key_pair" {
  description = "SSH Key pair"
  value       = tls_private_key.ssh_key_pair[*]
  sensitive   = true
}

output "cloud_init_done" {
  description = "This ID will be set when the `cloud-init --wait` command exits"
  value       = null_resource.wait_for_cloud_init.id
}

output "kubeconfig_ready" {
  description = "This ID will be set when the kubeconfig has been copied to the local machine"
  value       = null_resource.kubeconfig.id
}
