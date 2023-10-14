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

resource "cloudflare_record" "srv_mcproxy_1" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_minecraft._tcp"
  type    = "SRV"
  ttl     = "60"

  data {
    service  = "_minecraft"
    proto    = "_tcp"
    name     = "mcplay.biz"
    priority = 20
    weight   = 10
    port     = 25565
    target   = cloudflare_record.tcpshield.hostname
  }
}

resource "cloudflare_record" "srv_mcproxy_2" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_minecraft._tcp"
  type    = "SRV"
  ttl     = "60"

  data {
    service  = "_minecraft"
    proto    = "_tcp"
    name     = "mcplay.biz"
    priority = 10
    weight   = 10
    port     = 25565
    target   = cloudflare_record.proxy[1].hostname
  }
}

resource "cloudflare_record" "txt" {
  zone_id = data.cloudflare_zone.main.id
  name    = "@"
  value   = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  type    = "TXT"
}
