variable "auth_token" {
  sensitive = true
  type      = string
}
variable "cpem_version" {
  type    = string
  default = "v3.6.1"
}
variable "metro" {
  type    = string
  default = "da"
}
variable "kube_vip_version" {
  type    = string
  default = "v0.5.12"
}
variable "kubernetes_version" {
  type    = string
  default = "v1.26.4"
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
