data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "mx" {
  for_each = {
    aspmx0 = "aspmx.l.google.com"
    aspmx1 = "alt1.aspmx.l.google.com"
    aspmx2 = "alt2.aspmx.l.google.com"
    aspmx3 = "alt3.aspmx.l.google.com"
    aspmx4 = "alt4.aspmx.l.google.com"
  }
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  content = each.value
  type    = "MX"
}

resource "cloudflare_record" "txt" {
  for_each = {
    spf = {
      name    = "@"
      content = "v=spf1 include:ap.rp.oracleemaildelivery.com include:_spf.google.com ~all"
    }
    dmarc = {
      name    = "_dmarc"
      content = "v=DMARC1; p=quarantine; rua=mailto:14e67501080447ceb90a47e04b59eab1@dmarc-reports.cloudflare.net"
    }
  }
  zone_id = data.cloudflare_zone.main.id
  name    = each.value.name
  content = each.value.content
  type    = "TXT"
}

resource "cloudflare_record" "cname" {
  for_each = {
    name    = "alflag-prod-20240818._domainkey"
    content = "alflag-prod-20240818.alflag.org.dkim.kix1.oracleemaildelivery.com"
  }
  zone_id = data.cloudflare_zone.main.id
  name    = each.value.name
  content = each.value.content
  type    = "CNAME"
}
