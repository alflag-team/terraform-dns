variable "zone" {
  description = "Cloudflare zone"
  type        = string
  default     = "alflag.org"
}

variable "email" {
  description = "DMARC email"
  type        = string
  default     = "admin@alflag.org"
}
