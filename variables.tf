# Equinix Provider vars
variable "metal_project_id" {
  description = "Equinix project ID"
  sensitive   = true
  type        = string
}

variable "metal_auth_token" {
  description = "Equinix provider user auth token"
  sensitive   = true
  type        = string
}

variable "metal_metro" {
  description = "Metro of choice"
  type        = string
  default     = "da"
}

# K8s cluster vars
variable "cpem_version" {
  description = "Version of the CPEM"
  type        = string
  default     = "v3.6.2"
}

variable "kube_vip_version" {
  description = "KubeVip version of choice"
  type        = string
  default     = "v0.6.2"
}

variable "kubernetes_version" {
  description = "Kubernetes version. See https://www.downloadkubernetes.com/"
  type        = string
  default     = "v1.27.5"
}

variable "ssh_private_key_path" {
  description = "Path of the private key used to SSH into cluster nodes"
  sensitive   = true
  type        = string
  default     = ""
}

variable "tags" {
  type        = list(any)
  description = "String list of common tags for Equinix resources"
  default     = ["k8s-cluster-cluster1", "k8s-nodepool-pool1"]
}


# Control Plane hosts vars
variable "cp_ha" {
  description = "Whether to enable HA in Kubernetes control plane nodes"
  type        = bool
  default     = true
}

variable "k8s_cluster_cp_hostname" {
  description = "Hostname of each node in the control plane cluster"
  type        = string
  default     = "k8s-cluster1-pool1-cp"
}

variable "k8s_cluster_cp_plan" {
  description = "Plan of the nodes in the control plane cluster"
  type        = string
  default     = "m3.small.x86"
}

variable "k8s_cluster_cp_os" {
  description = "OS of the nodes in the control plane cluster"
  type        = string
  default     = "ubuntu_20_04"
}

variable "k8s_cluster_cp_billing_cycle" {
  description = "Billing Cycle of the nodes in the control plane cluster"
  type        = string
  default     = "hourly"
}


# Worker hosts vars
variable "worker_host_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

variable "k8s_cluster_worker_hostname" {
  description = "Hostname of each node in the worker cluster"
  type        = string
  default     = "k8s-cluster1-pool1-worker"
}

variable "k8s_cluster_worker_plan" {
  description = "Plan of the nodes in the worker cluster"
  type        = string
  default     = "m3.small.x86"
}

variable "k8s_cluster_worker_os" {
  description = "OS of the nodes in the worker cluster"
  type        = string
  default     = "ubuntu_20_04"
}

variable "k8s_cluster_worker_billing_cycle" {
  description = "Billing Cycle of the nodes in the worker cluster"
  type        = string
  default     = "hourly"
}
