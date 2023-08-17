variable "auth_token" {
  sensitive = true
  type      = string
}
variable "cpem_version" {
  type    = string
  default = "v3.5.0"
}
variable "kube_vip_version" {
  type    = string
  default = "v0.5.9"
}
variable "kubernetes_version" {
  type    = string
  default = "v1.26.1"
}
variable "project_id" {
  sensitive = true
  type      = string
}
variable "metro" {
  type      = string
}
variable "ssh_private_key_path" {
  sensitive = true
  type      = string
  default   = ""
}
