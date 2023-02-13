output "kubeapi-vip" {
  value = equinix_metal_reserved_ip_block.k8s-cluster1-pool1-cp1.address
}
output "ssh_key_pair" {
  value = tls_private_key.ssh_key_pair[*]
}
