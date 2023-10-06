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

variable "metro" {
  description = "Metro of choice"
  type        = string
  default     = "da"
}

variable "kube_vip_version" {
  description = "KubeVip version of choice"
  type        = string
  default     = "v0.6.2"
}

variable "kubernetes_version" {
  description = "Kubernetes version. See https://kubernetes.io/releases/patch-releases/#detailed-release-history-for-active-branches"
  type        = string
  default     = "v1.27.5"
}

variable "ssh_private_key_path" {
  description = "Path of the private key used to SSH into cluster nodes"
  sensitive   = true
  type        = string
  default     = ""
}

variable "cp_ha" {
  description = "Whether to enable HA in Kubernetes control plane nodes"
  type        = bool
  default     = true
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

variable "flannel_version" {
  description = "Version for installing Flannel CNI"
  type        = string
  default     = "latest"
}

variable "cloud_provider_external" {
  description = "Toggle to enable name of the cloud provider to be passed to kubeadm. Ex: --cloud-provider='external'"
  type        = bool
  default = true
}
