data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "mx" {
  zone_id  = data.cloudflare_zone.main.id
  name     = "@"
  value    = "mail71.onamae.ne.jp"
  type     = "MX"
  priority = "10"
  proxied  = false
}
