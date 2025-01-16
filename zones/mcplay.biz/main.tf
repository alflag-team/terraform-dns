data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "tcpshield" {
  zone_id = data.cloudflare_zone.main.id
  name    = "tcpshield"
  content = var.tcpshield
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}

resource "cloudflare_record" "txt_spf" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  content = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  type    = "TXT"
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_dmarc"
  content = "v=DMARC1; p=quarantine; rua=mailto:2ae3cde55ccd42dd926deb9db0f2f995@dmarc-reports.cloudflare.net,mailto:${var.email}"
  type    = "TXT"
}
