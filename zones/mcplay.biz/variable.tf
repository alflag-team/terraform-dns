variable "zone" {
  description = "Cloudflare zone"
  type        = string
  default     = "mcplay.biz"
}

variable "tcpshield" {
  description = "TCPShield backend CNAME"
  type        = string
  default     = "946b80aa2878512fac262127b8bbe144.ipv4.tcpshield.com"
}

variable "email" {
  description = "DMARC email"
  type        = string
  default     = "admin@mcplay.biz"
}
