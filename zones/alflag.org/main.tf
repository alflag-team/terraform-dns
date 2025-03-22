data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "mx" {
  for_each = {
    aspmx0 = {
      name    = "aspmx.l.google.com"
      priority = 1
    }
    aspmx1 = {
      name    = "alt1.aspmx.l.google.com"
      priority = 5
    }
    aspmx2 = {
      name    = "alt2.aspmx.l.google.com"
      priority = 5
    }
    aspmx3 = {
      name    = "alt3.aspmx.l.google.com"
      priority = 10
    }
    aspmx4 = {
      name    = "alt4.aspmx.l.google.com"
      priority = 10
    }
  }
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  content = each.value.name
  priority = each.value.priority
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

resource "cloudflare_record" "cname_no_proxy" {
  for_each = {
    dkim = {
      name    = "alflag-prod-20240818._domainkey"
      content = "alflag-prod-20240818.alflag.org.dkim.kix1.oracleemaildelivery.com"
    }
  }
  zone_id = data.cloudflare_zone.main.id
  name    = each.value.name
  content = each.value.content
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}
