## Requirements

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
