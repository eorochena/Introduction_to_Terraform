#####################
# Public IP Address #
#####################

data "http" "ip_address" {
  url = "http://ipv4.icanhazip.com"
}


