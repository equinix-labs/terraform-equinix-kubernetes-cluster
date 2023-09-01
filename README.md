# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | 1.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_equinix"></a> [equinix](#provider\_equinix) | 1.11.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [equinix_metal_bgp_session.k8s-cluster1-pool1-cp1](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_bgp_session) | resource |
| [equinix_metal_bgp_session.k8s-cluster1-pool1-cpx](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_bgp_session) | resource |
| [equinix_metal_device.k8s-cluster1-pool1-cp1](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_device) | resource |
| [equinix_metal_device.k8s-cluster1-pool1-cpx](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_device) | resource |
| [equinix_metal_device.k8s-cluster1-pool1-workerx](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_device) | resource |
| [equinix_metal_port.k8s-cp1](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_port) | resource |
| [equinix_metal_port.k8s-cpx](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_port) | resource |
| [equinix_metal_reserved_ip_block.k8s-cluster1-pool1-cp1](https://registry.terraform.io/providers/equinix/equinix/1.11.1/docs/resources/metal_reserved_ip_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | n/a | `string` | n/a | yes |
| <a name="input_cpem_version"></a> [cpem\_version](#input\_cpem\_version) | n/a | `string` | `"v3.5.0"` | no |
| <a name="input_kube_vip_version"></a> [kube\_vip\_version](#input\_kube\_vip\_version) | n/a | `string` | `"v0.5.9"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"v1.26.1"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | ~> 1.14.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_equinix"></a> [equinix](#provider\_equinix) | ~> 1.14.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [equinix_metal_bgp_session.k8s_cluster1_pool1_cp1](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_bgp_session) | resource |
| [equinix_metal_bgp_session.k8s_cluster1_pool1_cpx](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_bgp_session) | resource |
| [equinix_metal_device.k8s_cluster1_pool1_cp1](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_device) | resource |
| [equinix_metal_device.k8s_cluster1_pool1_cpx](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_device) | resource |
| [equinix_metal_device.k8s_cluster1_pool1_workerx](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_device) | resource |
| [equinix_metal_port.k8s_cp1](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_port) | resource |
| [equinix_metal_port.k8s_cpx](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_port) | resource |
| [equinix_metal_project_ssh_key.ssh_key_pair](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_project_ssh_key) | resource |
| [equinix_metal_reserved_ip_block.k8s_cluster1_pool1_cp1](https://registry.terraform.io/providers/equinix/equinix/latest/docs/resources/metal_reserved_ip_block) | resource |
| [local_sensitive_file.ssh_private_key_file](https://registry.terraform.io/providers/hashicorp/local/2.4.0/docs/resources/sensitive_file) | resource |
| [null_resource.kubeconfig](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |
| [null_resource.wait_for_cloud_init](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |
| [tls_private_key.ssh_key_pair](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | Equinix provider user auth token | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Equinix project ID | `string` | n/a | yes |
| <a name="input_cp_ha"></a> [cp\_ha](#input\_cp\_ha) | Whether to enable HA in Kubernetes control plane nodes | `bool` | `true` | no |
| <a name="input_cpem_version"></a> [cpem\_version](#input\_cpem\_version) | Version of the CPEM | `string` | `"v3.6.2"` | no |
| <a name="input_kube_vip_version"></a> [kube\_vip\_version](#input\_kube\_vip\_version) | KubeVip version of choice | `string` | `"v0.6.2"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version. See https://www.downloadkubernetes.com/ | `string` | `"v1.27.5"` | no |
| <a name="input_metro"></a> [metro](#input\_metro) | Metro of choice | `string` | `"da"` | no |
| <a name="input_ssh_private_key_path"></a> [ssh\_private\_key\_path](#input\_ssh\_private\_key\_path) | Path of the private key used to SSH into cluster nodes | `string` | `""` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | Number of worker nodes | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeapi_vip"></a> [kubeapi\_vip](#output\_kubeapi\_vip) | KubeVip IP Address |
| <a name="output_ssh_key_pair"></a> [ssh\_key\_pair](#output\_ssh\_key\_pair) | SSH Key pair |
<!-- END_TF_DOCS -->