variable "zone" {
  description = "Cloudflare zone"
  type        = string
  default     = "mcplay.biz"
}

variable "tcpshield" {
  description = "TCPShield backend CNAME"
  type        = string
  default     = "187f47ac9e331cf14b15afd04dec3c04.ipv4.tcpshield.com"
}
