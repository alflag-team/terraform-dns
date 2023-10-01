variable "zone" {
  description = "Cloudflare zone"
  type        = string
  default     = "mcplay.biz"
}

variable "proxy_ips" {
  description = "Proxy IPs"
  type        = list(string)
  default = [
    "131.186.58.191",
    "138.2.4.127",
  ]
}
