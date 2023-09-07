locals {
  cloud_config_cp_map = {
    AUTH_TOKEN         = var.auth_token
    CPEM_VERSION       = var.cpem_version
    KUBE_VIP_VERSION   = var.kube_vip_version
    KUBERNETES_VERSION = var.kubernetes_version
    PROJECT_ID         = var.project_id
    VIP                = equinix_metal_reserved_ip_block.k8s_cluster1_pool1_cp1.address
  }
}
resource "equinix_metal_device" "k8s_cluster1_pool1_cp1" {
  hostname         = "k8s-cluster1-pool1-cp1"
  plan             = "m3.small.x86"
  metro            = var.metro
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
  user_data        = templatefile("${path.module}/templates/cloud-config-cp-init.tftpl", local.cloud_config_cp_map)
  tags             = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}

resource "equinix_metal_device" "k8s_cluster1_pool1_cpx" {
  count            = var.cp_ha == true ? 2 : 0
  hostname         = "k8s-cluster1-pool1-cp${count.index + 2}"
  plan             = "m3.small.x86"
  metro            = var.metro
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
  user_data        = templatefile("${path.module}/templates/cloud-config-cp-join.tftpl", local.cloud_config_cp_map)
  tags             = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}
resource "equinix_metal_device" "k8s_cluster1_pool1_workerx" {
  count            = var.worker_count
  hostname         = "k8s-cluster1-pool1-worker${count.index + 1}"
  plan             = "m3.small.x86"
  metro            = var.metro
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
  user_data        = templatefile("${path.module}/templates/cloud-config-worker.tftpl", local.cloud_config_cp_map)
  tags             = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}

resource "equinix_metal_bgp_session" "k8s_cluster1_pool1_cp1" {
  device_id      = equinix_metal_device.k8s_cluster1_pool1_cp1.id
  address_family = "ipv4"
}

resource "equinix_metal_bgp_session" "k8s_cluster1_pool1_cpx" {
  count          = var.cp_ha == true ? 2 : 0
  device_id      = equinix_metal_device.k8s_cluster1_pool1_cpx[count.index].id
  address_family = "ipv4"
}

resource "equinix_metal_port" "k8s_cp1" {
  port_id = [for p in equinix_metal_device.k8s_cluster1_pool1_cp1.ports : p.id if p.name == "bond0"][0]
  bonded  = true
}

resource "equinix_metal_port" "k8s_cpx" {
  count   = var.cp_ha == true ? 2 : 0
  port_id = [for p in equinix_metal_device.k8s_cluster1_pool1_cpx[count.index].ports : p.id if p.name == "bond0"][0]
  bonded  = true
}

resource "equinix_metal_reserved_ip_block" "k8s_cluster1_pool1_cp1" {
  project_id = var.project_id
  metro      = var.metro
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
resource "local_sensitive_file" "ssh_private_key_file" {
  content         = tls_private_key.ssh_key_pair[0].private_key_openssh
  filename        = "ssh_key"
  file_permission = "0600"
  count           = var.ssh_private_key_path == "" ? 1 : 0
}

resource "null_resource" "wait_for_cloud_init" {
  depends_on = [
    local_sensitive_file.ssh_private_key_file,
    equinix_metal_reserved_ip_block.k8s_cluster1_pool1_cp1,
    equinix_metal_port.k8s_cp1,
    equinix_metal_bgp_session.k8s_cluster1_pool1_cp1,
    equinix_metal_device.k8s_cluster1_pool1_cp1
  ]

  connection {
    type        = "ssh"
    user        = "root"
    host        = equinix_metal_device.k8s_cluster1_pool1_cp1.network[0].address
    private_key = chomp(tls_private_key.ssh_key_pair[0].private_key_pem)
  }
  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait"
    ]
  }
}

resource "null_resource" "kubeconfig" {
  depends_on = [
    null_resource.wait_for_cloud_init,
  ]
  provisioner "local-exec" {
    command = join("", ["scp -o StrictHostKeyChecking=no -i ", local_sensitive_file.ssh_private_key_file[0].filename, " root@", equinix_metal_reserved_ip_block.k8s_cluster1_pool1_cp1.address, ":/etc/kubernetes/admin.conf kubeconfig.admin.yaml"])
  }

  provisioner "local-exec" {
    command = "echo 'Cluster SSH Key: ${local_sensitive_file.ssh_private_key_file[0].filename}\nKubeconfig file: kubeconfig.admin.yaml'"

  }

}
