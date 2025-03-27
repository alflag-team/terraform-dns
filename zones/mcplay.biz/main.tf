data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "_minecraft_tcp" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_minecraft._tcp"
  type    = "SRV"

  data {
    priority = 100
    weight   = 100
    port     = 25565
    target   = "tcpshield.mcplay.biz"
  }
}

resource "cloudflare_record" "mx" {
  for_each = {
    aspmx0 = {
      content  = "aspmx.l.google.com"
      priority = 1
    }
    aspmx1 = {
      content  = "alt1.aspmx.l.google.com"
      priority = 5
    }
    aspmx2 = {
      content  = "alt2.aspmx.l.google.com"
      priority = 5
    }
    aspmx3 = {
      content  = "alt3.aspmx.l.google.com"
      priority = 10
    }
    aspmx4 = {
      content  = "alt4.aspmx.l.google.com"
      priority = 10
    }
  }
  zone_id         = data.cloudflare_zone.main.id
  name            = "@"
  content         = each.value.content
  priority        = each.value.priority
  type            = "MX"
}

resource "cloudflare_record" "txt" {
  for_each = {
    spf = {
      name    = "@"
      content = "v=spf1 include:ap.rp.oracleemaildelivery.com include:_spf.google.com ~all"
    }
    dmarc = {
      name    = "_dmarc"
      content = "v=DMARC1; p=quarantine; rua=mailto:2ae3cde55ccd42dd926deb9db0f2f995@dmarc-reports.cloudflare.net"
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
      content = "alflag-prod-20240818.mcplay.biz.dkim.kix1.oracleemaildelivery.com"
    }
    tcpshield = {
      name    = "tcpshield"
      content = var.tcpshield
    }
  }
  zone_id = data.cloudflare_zone.main.id
  name    = each.value.name
  content = each.value.content
  type    = "CNAME"
  ttl     = "60"
  proxied = false
}
