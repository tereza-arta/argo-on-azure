//>>> Variables of the "network_components" module
variable "enable_net" {
  type        = bool
  default     = "true"
  description = "Enable current module or not"
}

variable "az_region" {
  default = "North Europe"
}

variable "virtual_net" {
  default = "vnet"
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "Public-subnet"
}

variable "sub-addr-prefix" {
  default = "10.0.1.0/24"
}

variable "pub_ip_cnt" {
  type    = number
  default = 2
}

variable "pub_ip_alloc_method" {
  default = "Static"
}

variable "ip_sku" {
  default = "Basic"
}

variable "nat_name" {
  default = "For-priv-sub"
}

variable "nic_cnt" {
  type    = number
  default = 2
}

variable "priv_ip_alloc" {
  default = "Dynamic"
}

//>>> Variables of the "security_group" module
variable "enable_nsg" {
  type        = bool
  default     = "true"
  description = "Enable current module or not"
}

variable "nsg_name" {
  default = "sg-example"
}

variable "sg_rule_1_name" {
  default = "Allow-port-22"
}

variable "sg_rule_2_name" {
  default = "Allow-port-80"
}

variable "sg_rule_3_name" {
  default = "Argo-app-nodeport"
}

variable "sg_rule_4_name" {
  default = "Base-app-nodeport"
}

variable "sg_rule_1_prt" {
  type    = number
  default = 100
}

variable "sg_rule_2_prt" {
  type    = number
  default = 110
}

variable "sg_rule_3_prt" {
  type    = number
  default = 120
}

variable "sg_rule_4_prt" {
  type    = number
  default = 130
}

variable "argo-app-nodeport" {
  type    = number
  default = 30009
}

variable "base-app-nodeport" {
  type    = number
  default = 30008
}

variable "sg_rule_type" {
  default = "Inbound"
}

variable "sg_rule_access" {
  default = "Allow"
}

variable "sg_rule_protocol" {
  default = "Tcp"
}

variable "sg_src_port_range" {
  default = "*"
}

variable "addr_prefix" {
  default = "*"
}

variable "sg_dest_port_range" {
  default = "22"
}

variable "ass_cnt" {
  type    = number
  default = 2
}

//>>> Variables of the "vm_config" module
variable "enable_vm" {
  type        = bool
  default     = "true"
  description = "Enable current module or not"
}

variable "img_publisher" {
  default = "Canonical"
}

variable "img_offer" {
  default = "0001-com-ubuntu-server-focal"
}

variable "img_sku" {
  default = "20_04-lts"
}

variable "vm_cnt" {
  type    = number
  default = 2
}

variable "vm_name" {
  type    = string
  default = "azure-vm"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "admin_uname" {
  default = "azureuser"
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "os_disk_sa" {
  default = "Standard_LRS"
}
