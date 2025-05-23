data "cloudflare_zone" "main" {
  name = var.zone
}

resource "cloudflare_record" "_minecraft_tcp" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_minecraft._tcp"
  type    = "SRV"
  ttl     = 60

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

  zone_id  = data.cloudflare_zone.main.id
  name     = "@"
  content  = each.value.content
  priority = each.value.priority
  type     = "MX"
  ttl      = 60
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
    dkim = {
      name    = "cf2024-1._domainkey"
      content = "v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiweykoi+o48IOGuP7GR3X0MOExCUDY/BCRHoWBnh3rChl7WhdyCxW3jgq1daEjPPqoi7sJvdg5hEQVsgVRQP4DcnQDVjGMbASQtrY4WmB1VebF+RPJB2ECPsEDTpeiI5ZyUAwJaVX7r6bznU67g7LvFq35yIo4sdlmtZGV+i0H4cpYH9+3JJ78km4KXwaf9xUJCWF6nxeD+qG6Fyruw1Qlbds2r85U9dkNDVAS3gioCvELryh1TxKGiVTkg4wqHTyHfWsp7KD3WQHYJn0RyfJJu6YEmL77zonn7p2SRMvTMP3ZEXibnC9gz3nnhR6wcYL8Q7zXypKTMD58bTixDSJwIDAQAB"
    }
    google_site_verification = {
      name    = "@"
      content = "google-site-verification=9TYV_tUJ6LSGSigWKeaIYxOtdznXuT7ZLKJEk7aCVdQ"
    }
  }

  zone_id = data.cloudflare_zone.main.id
  name    = each.value.name
  content = each.value.content
  type    = "TXT"
  ttl     = 60
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
