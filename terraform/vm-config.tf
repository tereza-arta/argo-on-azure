resource "azurerm_resource_group" "some" {
  name     = "rg-example"
  location = "North Europe"
}

data "azurerm_platform_image" "platform_img" {
  location  = azurerm_resource_group.some.location
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts"
}

resource "azurerm_virtual_network" "net" {
  name = "net-example"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.some.location
  resource_group_name = azurerm_resource_group.some.name
}

resource "azurerm_subnet" "subnet" {
  name = "subnet-example"
  resource_group_name = azurerm_resource_group.some.name
  virtual_network_name = azurerm_virtual_network.net.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "ip" {
  count = var.pub_ip_cnt
  name = "pub-ip-${count.index + 1}"
  #name = "mpub-ip-1"
  location = azurerm_resource_group.some.location
  resource_group_name = azurerm_resource_group.some.name
  allocation_method = "Static"
  sku = "Basic"
}

resource "azurerm_network_interface" "nic" {
  count = var.nic_cnt
  name = "nic-${count.index + 1}"
  #name = "mnic-1"
  location = azurerm_resource_group.some.location
  resource_group_name = azurerm_resource_group.some.name

  ip_configuration {
    name = "ip-config"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ip[count.index].id
    #public_ip_address_id = azurerm_public_ip.ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-nic" {
  count = 2
  network_interface_id = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm"{
  count = var.vm_cnt
  name = format("%s-%d", var.vm_name, count.index + 1)
  #name = "azure-vm-1"
  resource_group_name = azurerm_resource_group.some.name
  location = azurerm_resource_group.some.location
  size = var.vm_size
  admin_username = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  #network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = data.azurerm_platform_image.platform_img.publisher
    offer = data.azurerm_platform_image.platform_img.offer
    sku = data.azurerm_platform_image.platform_img.sku
    version = data.azurerm_platform_image.platform_img.version
  }
}
