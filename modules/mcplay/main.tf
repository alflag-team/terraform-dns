data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "proxy" {
  count = length(var.proxy_ips)

  zone_id = data.cloudflare_zone.main.id
  name    = "proxy"
  value   = var.proxy_ips[count.index]
  type    = "A"
  ttl     = "60"
  proxied = false
}

resource "cloudflare_record" "tcpshield" {
  zone_id = data.cloudflare_zone.main.id
  name    = "tcpshield"
  value   = "946b80aa2878512fac262127b8bbe144.ipv4.tcpshield.com"
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}

resource "cloudflare_record" "txt" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  value   = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  type    = "TXT"
}
