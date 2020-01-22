provider "hcloud" {
  token = var.token
}

provider "aws" {
  version = "~> 2.0"
  region = "eu-central-1"
}

data "hcloud_locations" "ds" {
}

resource "hcloud_ssh_key" "default" {
  name       = var.ssh_key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "simple-models-sever" {
  name = join ("-0", [var.progect_name, count.index + 1])
  image = var.progect_image
  server_type = var.progect_server_type
  location = element(data.hcloud_locations.ds.names, count.index)
  count = 1
  ssh_keys = ["${hcloud_ssh_key.default.name}"]
}
