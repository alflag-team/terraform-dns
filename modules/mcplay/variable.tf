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

variable "tcpshield" {
  description = "TCPShield backend CNAME"
  type        = string
  default     = "946b80aa2878512fac262127b8bbe144.ipv4.tcpshield.com"
}
