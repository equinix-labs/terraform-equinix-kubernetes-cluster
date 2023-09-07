# CPEM Example

This is an example of how to utilize the root module with the [CPEM add-on](https://github.com/equinix-labs/terraform-equinix-kubernetes-addons/tree/main/modules/cloud_provider_equinix_metal) module.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | ~> 1.14.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_addons"></a> [kubernetes\_addons](#module\_kubernetes\_addons) | equinix-labs/kubernetes-addons/equinix | 0.3.0 |
| <a name="module_tfk8s"></a> [tfk8s](#module\_tfk8s) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | Equinix provider user auth token | `string` | n/a | yes |
| <a name="input_cp_ha"></a> [cp\_ha](#input\_cp\_ha) | Whether to enable HA in Kubernetes control plane nodes | `bool` | `true` | no |
| <a name="input_cpem_version"></a> [cpem\_version](#input\_cpem\_version) | Version of the CPEM | `string` | `"v3.6.2"` | no |
| <a name="input_kube_vip_version"></a> [kube\_vip\_version](#input\_kube\_vip\_version) | KubeVip version of choice | `string` | `"v0.6.2"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version. See https://www.downloadkubernetes.com/ | `string` | `"v1.27.5"` | no |
| <a name="input_metro"></a> [metro](#input\_metro) | Metro of choice | `string` | `"da"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Equinix project ID | `string` | n/a | yes |
| <a name="input_ssh_private_key_path"></a> [ssh\_private\_key\_path](#input\_ssh\_private\_key\_path) | Path of the private key used to SSH into cluster nodes | `string` | `""` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | Number of worker nodes | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_addons_outputs"></a> [kubernetes\_addons\_outputs](#output\_kubernetes\_addons\_outputs) | Outputs of the kubernetes\_addons module |
| <a name="output_tfk8s_outputs"></a> [tfk8s\_outputs](#output\_tfk8s\_outputs) | Outputs of the tfk8s module |
<!-- END_TF_DOCS -->
