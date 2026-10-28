rg_names = {
  rg1 = {
    name     = "Axoin_system12"
    location = "South Africa North"
  }
  rg2 = {
    name     = "Axoin_system123"
    location = "eastus"
  }
}
vnet_name = {
  vnet1 = {
    name                = "Axoin_system12_vnet"
    location            = "South Africa North"
    resource_group_name = "Axoin_system12"
    address_space       = ["10.0.0.0/16"]

  }
}
subnet_name = {
  subnet1 = {
    name                 = "Axoin_system12_frontend_subnet"
    virtual_network_name = "Axoin_system12_vnet"
    resource_group_name  = "Axoin_system12"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "Axoin_system12_backend_subnet"
    virtual_network_name = "Axoin_system12_vnet"
    resource_group_name  = "Axoin_system12"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "Axoin_system12_database_subnet"
    virtual_network_name = "Axoin_system12_vnet"
    resource_group_name  = "Axoin_system12"
    address_prefixes     = ["10.0.3.0/24"]
  }
   subnet4 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "Axoin_system12_vnet"
    resource_group_name  = "Axoin_system12"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

public_ip = {
  pip1 = {
    name                = "frontend_pip"
    location            = "South Africa North"
    resource_group_name = "Axoin_system12"
    allocation_method   = "Static"
    sku                 = "Standard"

  }
  # pip2 = {
  #   name                = "backend_pip"
  #   location            = "South Africa North"
  #   resource_group_name = "Axoin_system12"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"

  # }
  # pip3 = {
  #   name                = "database_pip"
  #   location            = "South Africa North"
  #   resource_group_name = "Axoin_system12"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"

  # }
}



nsg_name = {
  nsg1 = {
    name                = "frontend_nsg"
    location            = "South Africa North"
    resource_group_name = "Axoin_system12"

    security_rules = [
      {
        name      = "Allow-SSH"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTP"
        priority  = 110
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTPS"
        priority  = 120
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }



  nsg2 = {
    name                = "backend_nsg"
    location            = "South Africa North"
    resource_group_name = "Axoin_system12"

    security_rules = [
      {
        name      = "Allow-SSH"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTP"
        priority  = 110
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTPS"
        priority  = 120
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  nsg3 = {
    name                = "database_nsg"
    location            = "South Africa North"
    resource_group_name = "Axoin_system12"

    security_rules = [
      {
        name      = "Allow-SSH"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTP"
        priority  = 110
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

      {
        name      = "Allow-HTTPS"
        priority  = 120
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}


vms = {
  vm1 = {
    vm_name              = "Axion-frontend-vm"
    resource_group_name  = "Axoin_system12"
    location             = "South Africa North"
    vm_size              = "Standard_DS1_v2"
    admin_password       = "Kuldeep@123456"
    admin_username       = "Kuldeep@admin"
    subnet_name          = "Axoin_system12_frontend_subnet"
    virtual_network_name = "Axoin_system12_vnet"
    nic_name             = "frontend_nic"
    public_ip_name       = "frontend_pip"
    nsg_name             = "frontend_nsg"

  }
  vm2 = {
    vm_name              = "Axion-backend-vm"
    resource_group_name  = "Axoin_system12"
    location             = "South Africa North"
    vm_size              = "Standard_DS1_v2"
    admin_password       = "Kuldeep@123456"
    admin_username       = "Kuldeep@admin1"
    subnet_name          = "Axoin_system12_backend_subnet"
    virtual_network_name = "Axoin_system12_vnet"
    nic_name             = "backend_nic"
    public_ip_name       = "backend_pip"
    nsg_name             = "backend_nsg"

  }
  vm3 = {
    vm_name              = "Axion-database-vm"
    resource_group_name  = "Axoin_system12"
    location             = "South Africa North"
    vm_size              = "Standard_DS1_v2"
    admin_password       = "Kuldeep@12345"
    admin_username       = "Kuldeep@admin"
    subnet_name          = "Axoin_system12_database_subnet"
    virtual_network_name = "Axoin_system12_vnet"
    nic_name             = "database_nic"
    public_ip_name       = "database_pip"
    nsg_name             = "frontend_nsg"

  }
}
bastions = {
  bastion1 = {
    name                = "bastion1"
    location            = "South Africa North"
    rg_name             = "Axoin_system12"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "Axoin_system12_vnet"
    public_ip_name      = "bastion_pip"
  }
}

