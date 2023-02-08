variable "auth_token" {
  type = string
}
variable "project_id" {
  type = string
}
variable "kube_vip_version" {
  type    = string
  default = "v0.5.5"
}
variable "kubernetes_version" {
  type    = string
  default = "v1.25.3"
}
variable "cpem_version" {
  type    = string
  default = "v3.5.0"
}
