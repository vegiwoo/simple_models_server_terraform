// SSH Key - name
variable ssh_key_name {
	default = "Vgw ssh key"
}

// Project - Simple Models Server
variable progect_name {
	default = "simple-models-sever"
}

// Получить все OC - curl -H "Authorization: Bearer [APITOKEN]" 'https://api.hetzner.cloud/v1/images'
variable progect_image {
	default = "ubuntu-18.04"
}

variable progect_server_type {
  default = "cx11"
}
