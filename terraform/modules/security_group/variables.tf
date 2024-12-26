variable "nsg_cnt" {
  type    = number
  default = 1
}

variable "nsg_name" {
  default     = "sg-example"
  description = "Network Security Group name"
}

variable "location" {
  type        = string
  description = "Azure region location"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "inbound_cnt" {
  type        = number
  default     = 4
  description = "Count of NSG Inbound-rule"
}

variable "outbound_cnt" {
  type        = number
  default     = 0
  description = "Count of NSG Inbound-rule"
}

variable "rule_type_1" {
  default     = "Inbound"
  description = "Rule type - Inbound"
}

variable "rule_type_2" {
  default     = "Outbound"
  description = "Rule type - Inbound"
}

variable "tcp_cnt" {
  type        = number
  default     = 5
  description = "Count of rules with TCP protocol"
}

variable "udp_cnt" {
  type        = number
  default     = 0
  description = "Count of rules with UDP protocol"
}

variable "src_port_range" {
  default     = "*"
  description = "NSG rule source port range"
}

variable "dest_port_range" {
  type        = list(number)
  default     = [22, 80, 30009, 30008, 6443]
  description = "List of NSG Inbound rules desination"
}

variable "out_dest_port_range" {
  type        = any
  default     = ["*"]
  description = "List of NSG Inbound rules desination"
}

variable "src_addr_prefix" {
  default     = "*"
  description = "NSG src/dest address prefix"
}

variable "dest_addr_prefix" {
  default     = "*"
  description = "NSG src/dest address prefix"
}

variable "sg_index" {
  type        = number
  default     = 0
  description = "Index of preferred NSG"
}

variable "ass_cnt" {
  type        = number
  default     = 2
  description = "NSG-NI-association resource count"
}

variable "net_interface_ids" {
  type        = list(string)
  description = "Network interface ids list"
}


