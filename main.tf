locals {
  cloud_config_cp_map = {
    AUTH_TOKEN         = var.auth_token
    CPEM_VERSION       = var.cpem_version
    KUBE_VIP_VERSION   = var.kube_vip_version
    KUBERNETES_VERSION = var.kubernetes_version
    PROJECT_ID         = var.project_id
    VIP                = equinix_metal_reserved_ip_block.k8s-cluster1-pool1-cp1.address
  }
}
resource "equinix_metal_device" "k8s-cluster1-pool1-cp1" {
  hostname         = "k8s-cluster1-pool1-cp1"
  plan             = "m3.small.x86"
  metro            = "da"
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
  user_data        = templatefile("${path.module}/cloud-config-cp-init.tftpl", local.cloud_config_cp_map)
  tags             = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}

resource "equinix_metal_device" "k8s-cluster1-pool1-cpx" {
  count            = 2
  hostname         = "k8s-cluster1-pool1-cp${count.index + 2}"
  plan             = "m3.small.x86"
  metro            = "da"
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
  user_data        = templatefile("${path.module}/cloud-config-cp-join.tftpl", local.cloud_config_cp_map)
  tags             = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}
resource "equinix_metal_device" "k8s-cluster1-pool1-workerx" {
  count            = 1
  hostname         = "k8s-cluster1-pool1-worker${count.index}"
  plan             = "m3.small.x86"
  metro            = "da"
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
  user_data        = templatefile("${path.module}/cloud-config-worker.tftpl", local.cloud_config_cp_map)
  tags             = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}

resource "equinix_metal_bgp_session" "k8s-cluster1-pool1-cp1" {
  device_id      = equinix_metal_device.k8s-cluster1-pool1-cp1.id
  address_family = "ipv4"
}

resource "equinix_metal_bgp_session" "k8s-cluster1-pool1-cpx" {
  count          = 2
  device_id      = equinix_metal_device.k8s-cluster1-pool1-cpx[count.index].id
  address_family = "ipv4"
}

resource "equinix_metal_port" "k8s-cp1" {
  port_id = [for p in equinix_metal_device.k8s-cluster1-pool1-cp1.ports : p.id if p.name == "bond0"][0]
  bonded  = true
}

resource "equinix_metal_port" "k8s-cpx" {
  count   = 2
  port_id = [for p in equinix_metal_device.k8s-cluster1-pool1-cpx[count.index].ports : p.id if p.name == "bond0"][0]
  bonded  = true
}

resource "equinix_metal_reserved_ip_block" "k8s-cluster1-pool1-cp1" {
  project_id = var.project_id
  metro      = "da"
  quantity   = 1
}

resource "tls_private_key" "ssh_key_pair" {
  algorithm = "ED25519"
  count     = var.ssh_private_key_path == "" ? 1 : 0
}

resource "equinix_metal_project_ssh_key" "ssh_key_pair" {
  count      = var.ssh_private_key_path == "" ? 1 : 0
  name       = "ssh_key_pair"
  project_id = var.project_id
  public_key = tls_private_key.ssh_key_pair[count.index].public_key_openssh
}
