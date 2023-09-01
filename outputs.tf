output "kubeapi_vip" {
  description = "KubeVip IP Address"
  value       = equinix_metal_reserved_ip_block.k8s_cluster1_pool1_cp1.address
}

output "ssh_key_pair" {
  description = "SSH Key pair"
  value       = tls_private_key.ssh_key_pair[*]
  sensitive   = true
}
