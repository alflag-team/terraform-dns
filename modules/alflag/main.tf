data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "issues" {
  zone_id         = data.cloudflare_zone.main.id
  name            = "issues"
  value           = "alflag.youtrack.cloud"
  type            = "CNAME"
  ttl             = "3600"
  proxied         = false
  allow_overwrite = true
}
