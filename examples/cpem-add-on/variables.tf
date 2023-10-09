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

variable "cpem_version" {
  description = "Version of the CPEM"
  type        = string
  default     = "v3.6.2"
}

variable "metal_metro" {
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

variable "cp_ha" {
  description = "Whether to enable HA in Kubernetes control plane nodes"
  type        = bool
  default     = true
}

variable "worker_host_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

variable "cloud_provider_external" {
  description = "Toggle to enable cloud provider to be passed to kubeadm as 'external'. Ex: --cloud-provider='external'"
  type        = bool
  default     = true
}
