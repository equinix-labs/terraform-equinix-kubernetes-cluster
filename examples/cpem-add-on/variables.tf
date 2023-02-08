variable "auth_token" {
  type        = string
  description = "Equinix Metal API key"
  sensitive   = true
}

variable "project_id" {
  type        = string
  description = "Equinix Metal Project ID"
}

variable "metro" {
  type        = string
  description = "Equinix Metal Metro"
  default     = "sv"
}

variable "ssh_key_file" {
  type        = string
  description = "Path to SSH key file for access to cluster nodes"
}

variable "count_x86" {
  type        = string
  description = "Number of x86 nodes"
  default     = "3"
}

variable "count_arm" {
  type        = string
  description = "Number of ARM nodes"
  default     = "0"
}

variable "cluster_name" {
  type        = string
  description = "Name of your cluster. Alpha-numeric and hyphens only, please."
  default     = "metal-multiarch-k8s"
}
variable "private_key_path" {
  type        = string
  description = "Path to an SSH key to use for the connection"
}
variable "host" {
  type        = string
  description = "The address of the server from where to perform kubectl installations and changes"
}
variable "user" {
  type        = string
  description = "The username of the ssh key used to connect to the server defined in host"
  default     = "root"
}
