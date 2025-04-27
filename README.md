# dns

DNS に関する Terraform のコードを管理するリポジトリです。

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alflag"></a> [alflag](#module\_alflag) | ./zones/alflag.org | n/a |
| <a name="module_mcplay"></a> [mcplay](#module\_mcplay) | ./zones/mcplay.biz | n/a |
| <a name="module_vlouty"></a> [vlouty](#module\_vlouty) | ./zones/vlouty.com | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
