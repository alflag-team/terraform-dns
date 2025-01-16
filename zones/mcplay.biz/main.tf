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
  value   = var.tcpshield
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}

resource "cloudflare_record" "txt_spf" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  value   = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  type    = "TXT"
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=quarantine; rua=mailto:2ae3cde55ccd42dd926deb9db0f2f995@dmarc-reports.cloudflare.net,mailto:${var.email}"
  type    = "TXT"
}
