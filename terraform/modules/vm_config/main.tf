data "azurerm_platform_image" "platform_img" {
  location  = var.location
  publisher = var.img_publisher
  offer     = var.img_offer
  sku       = var.img_sku
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = var.vm_cnt
  name  = format("%s-%d", var.vm_name, count.index + 1)
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_uname
  network_interface_ids = [element(var.net_interface_ids, count.index)]

  admin_ssh_key {
    username   = var.admin_uname
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_sa
  }

  source_image_reference {
    publisher = data.azurerm_platform_image.platform_img.publisher
    offer     = data.azurerm_platform_image.platform_img.offer
    sku       = data.azurerm_platform_image.platform_img.sku
    version   = data.azurerm_platform_image.platform_img.version
  }
}
