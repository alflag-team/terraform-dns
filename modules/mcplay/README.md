<!-- BEGIN_TF_DOCS -->
# mcplay

MCPlayNetwork の DNS レコードを管理するためのモジュールです。

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.proxy](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.tcpshield](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.txt](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.main](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_proxy_ips"></a> [proxy\_ips](#input\_proxy\_ips) | Proxy IPs | `list(string)` | <pre>[<br>  "131.186.58.191",<br>  "138.2.4.127"<br>]</pre> | no |
| <a name="input_tcpshield"></a> [tcpshield](#input\_tcpshield) | TCPShield backend CNAME | `string` | `"946b80aa2878512fac262127b8bbe144.ipv4.tcpshield.com"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Cloudflare zone | `string` | `"mcplay.biz"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | n/a |
<!-- END_TF_DOCS -->