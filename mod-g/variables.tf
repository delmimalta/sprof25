variable "OS_AUTH_URL" {
	type = string
	sensitive = true
}

variable "OS_PROJECT_NAME" {
	type = string
	sensitive = true
}

variable "OS_USERNAME" {
	type = string
	sensitive = true
}

variable "OS_PASSWORD" {
	type = string
	sensitive = true
}












# ID для образа "alt-p10-cloud-x86_64.qcow2" (Starterkit)


#variable "image_id" {
#	type = string
#	default = "92e78753-4f88-40eb-a10a-5a7fb9bfc106"
#}

# ID для шаблона 1 vCPU 1 RAM (openstack --insecure flavor list)


#variable "flavor_id" {
#	type = string
#	default = "1f64883c-1cdd-45e4-ac8a-82ab57a12fdf"
#}

# Имя ssh-ключа


#variable "key_pair" {
#	type = string
#	default = "cloud"
#}
