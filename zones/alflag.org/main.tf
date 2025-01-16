data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "txt_google" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  content = "google-site-verification=9LYYBMFLbQVP7G7N-wd5CoJnrbQm0MeYeMTn1ItoPdg"
  type    = "TXT"
}

resource "cloudflare_record" "txt_spf" {
  zone_id         = data.cloudflare_zone.main.id
  name            = "@"
  content         = "v=spf1 include:_spf.mx.cloudflare.net include:ap.rp.oracleemaildelivery.com ~all"
  type            = "TXT"
  allow_overwrite = true
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_dmarc"
  content = "v=DMARC1; p=quarantine; rua=mailto:14e67501080447ceb90a47e04b59eab1@dmarc-reports.cloudflare.net"
  type    = "TXT"
}
