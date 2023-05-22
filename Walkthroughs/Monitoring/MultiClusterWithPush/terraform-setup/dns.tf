data "digitalocean_domain" "zone" {
  name = "plgrnd.be"
}

resource "digitalocean_record" "central_monitoring" {
  domain = data.digitalocean_domain.zone.name
  type   = "A"
  name   = "*.central-monitoring"
  value  = sort(local.worker_ips_downstream_central_monitoring)[0]
  ttl    = 60
}
output "dns_central_monitoring" {
  value = digitalocean_record.central_monitoring.fqdn
}
