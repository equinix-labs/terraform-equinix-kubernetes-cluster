# Cluster With Flannel Example

This is an example of how to make the cluster running installing [Flannel CNI](https://github.com/flannel-io/flannel#deploying-flannel-with-kubectl) after cluster install via this module.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | ~> 1.20.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.2.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfk8s"></a> [tfk8s](#module\_tfk8s) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [null_resource.install_cni_flannel](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metal_auth_token"></a> [metal\_auth\_token](#input\_metal\_auth\_token) | Equinix provider user auth token | `string` | n/a | yes |
| <a name="input_metal_project_id"></a> [metal\_project\_id](#input\_metal\_project\_id) | Equinix project ID | `string` | n/a | yes |
| <a name="input_cloud_provider_external"></a> [cloud\_provider\_external](#input\_cloud\_provider\_external) | Toggle to enable cloud provider to be passed to kubeadm as 'external'. Ex: --cloud-provider='external' | `bool` | `true` | no |
| <a name="input_cp_ha"></a> [cp\_ha](#input\_cp\_ha) | Whether to enable HA in Kubernetes control plane nodes | `bool` | `true` | no |
| <a name="input_flannel_version"></a> [flannel\_version](#input\_flannel\_version) | Version for installing Flannel CNI | `string` | `"v0.24.2"` | no |
| <a name="input_kube_vip_version"></a> [kube\_vip\_version](#input\_kube\_vip\_version) | KubeVip version of choice | `string` | `"v0.6.2"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version. See https://kubernetes.io/releases/patch-releases/#detailed-release-history-for-active-branches | `string` | `"v1.27.5"` | no |
| <a name="input_metal_metro"></a> [metal\_metro](#input\_metal\_metro) | Metro of choice | `string` | `"da"` | no |
| <a name="input_worker_host_count"></a> [worker\_host\_count](#input\_worker\_host\_count) | Number of worker nodes | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfk8s_outputs"></a> [tfk8s\_outputs](#output\_tfk8s\_outputs) | Outputs of the tfk8s module |
<!-- END_TF_DOCS -->
