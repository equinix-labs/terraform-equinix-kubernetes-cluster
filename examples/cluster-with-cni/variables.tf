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

variable "cp_ha" {
  description = "Whether to enable HA in Kubernetes control plane nodes"
  type        = bool
  default     = true
}

# Worker hosts vars
variable "worker_host_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

variable "flannel_version" {
  description = "Version for installing Flannel CNI"
  type        = string
  default     = "v0.24.2"

  validation {
    condition     = length(var.flannel_version) > 0 && substr(var.flannel_version, 0, 1) == "v"
    error_message = "The flannel_version variable must be set. It must also start with string \"v\"."
  }
}

variable "cloud_provider_external" {
  description = "Toggle to enable cloud provider to be passed to kubeadm as 'external'. Ex: --cloud-provider='external'"
  type        = bool
  default     = true
}
