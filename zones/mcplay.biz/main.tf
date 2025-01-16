data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "alflag-prod-20240818" {
  zone_id = data.cloudflare_zone.main.id
  name    = "alflag-prod-20240818._domainkey"
  content = "alflag-prod-20240818.mcplay.biz.dkim.kix1.oracleemaildelivery.com"
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}

resource "cloudflare_record" "tcpshield" {
  zone_id = data.cloudflare_zone.main.id
  name    = "tcpshield"
  content = var.tcpshield
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}

resource "cloudflare_record" "txt_google" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  content = "google-site-verification=_9mfE9SsuSmc8huJAl3glGlMJn_VkcOCgH9ljQmTzUU"
  type    = "TXT"
}

resource "cloudflare_record" "txt_spf" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  content = "v=spf1 include:_spf.mx.cloudflare.net include:ap.rp.oracleemaildelivery.com ~all"
  type    = "TXT"
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_dmarc"
  content = "v=DMARC1; p=quarantine; rua=mailto:2ae3cde55ccd42dd926deb9db0f2f995@dmarc-reports.cloudflare.net,mailto:${var.email}"
  type    = "TXT"
}
