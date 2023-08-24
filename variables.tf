variable "auth_token" {
  sensitive = true
  type      = string
}
variable "cpem_version" {
  type    = string
  default = "v3.6.2"
}
variable "metro" {
  type    = string
  default = "da"
}
variable "kube_vip_version" {
  type    = string
  default = "v0.6.2"
}
variable "kubernetes_version" {
  type    = string
  default = "v1.27.5"
}
variable "project_id" {
  sensitive = true
  type      = string
}
variable "ssh_private_key_path" {
  sensitive = true
  type      = string
  default   = ""
}
variable "cp_count" {
  type    = number
  default = 1
}
variable "worker_count" {
  type    = number
  default = 1
}
