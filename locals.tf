locals {
  network = {
    sto01  = "10.0.8.0/24"
    sto02  = "10.0.9.0/24"
    dmz01  = "10.0.14.0/24"
    bo01   = "10.0.10.0/24"
    lab01  = "10.0.21.0/24"
    lab02  = "10.0.22.0/24"
    lab03  = "10.0.23.0/24"
    lab04  = "10.0.24.0/24"
    lab05  = "10.0.25.0/24"
    test01 = "10.0.31.0/24"
    test02 = "10.0.32.0/24"
    pub01  = "185.93.174.0/24"
    prod01 = "10.0.41.0/24"
  }

  portgroup = {
    eden       = "eden (10.0.11.x, vlan 11)"
    dev        = "dev (10.0.12.x, vlan 12)"
    mgmt       = "mgmt (10.0.7.x, vlan 7)"
    vsphere-ha = "vsphere-ha (10.0.13.x, vlan 13)"
    dmz01      = "dmz01 (10.0.14.x, vlan 14)"
    bo01       = "cg-bo01 (10.0.10.x, vlan 10)"
    lab01      = "cg-lab01 (10.0.21.x, vlan 21)"
    lab02      = "cg-lab02 (10.0.22.x, vlan 22)"
    lab03      = "cg-lab03 (10.0.23.x, vlan 23)"
    lab04      = "cg-lab04 (10.0.24.x, vlan 24)"
    lab05      = "cg-lab05 (10.0.25.x, vlan 25)"
    k8s01      = "k8s01 (10.0.27.x, vlan 27)"
    k8s02      = "k8s02 (10.0.28.x, vlan 28)"
    iscsi01    = "iscsi01 (10.255.255.x, vlan 255)"
    iscsi02    = "iscsi02 (10.255.254.x, vlan 254)"
    vmotion    = "vmotion (10.255.253.x, vlan 253)"
    test01     = "test01 (10.0.31.x, vlan 31)"
    test02     = "test02 (10.0.32.x, vlan 32)"
    pub01      = "cg-pub01 (185.93.174.x, vlan 185)"
    sto01      = "cg-sto01 (10.0.8.x, vlan 8)"
    sto02      = "cg-sto02 (10.0.9.x, vlan 9)"
    prod01     = "cg-prod01 (10.0.41.x, vlan 41)"
  }

  portgroups = {
  }

  storage_cluster = {
    prod  = "SM01"
    stage = "SM01"
    m3    = "SPEZI"
  }

  pub01 = {
    folder            = "dc-pub01"
    portgroup         = local.portgroup.pub01
    datastore_cluster = local.storage_cluster.prod
    domain            = "noroutine.cloud"
    network           = local.network.pub01
    netmask           = "255.255.255.0"
    gateway           = "185.93.174.1"
    nameserver        = "185.93.174.1"
    puppet            = "10.0.10.4"
  }

  sto01 = {
    folder            = "dc-sto01"
    portgroup         = local.portgroup.sto01
    datastore_cluster = local.storage_cluster.prod
    domain            = "node.sto01.noroutine.me"
    network           = local.network.sto01
    netmask           = "255.255.255.0"
    gateway           = "10.0.8.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  sto02 = {
    folder            = "dc-sto02"
    portgroup         = local.portgroup.sto02
    datastore_cluster = local.storage_cluster.prod
    domain            = "node.sto02.noroutine.me"
    network           = local.network.sto02
    netmask           = "255.255.255.0"
    gateway           = "10.0.9.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  bo01 = {
    folder            = "dc-bo01"
    portgroup         = local.portgroup.bo01
    datastore_cluster = local.storage_cluster.prod
    domain            = "node.bo01.noroutine.me"
    network           = local.network.bo01
    netmask           = "255.255.255.0"
    gateway           = "10.0.10.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  dmz01 = {
    folder            = "dc-dmz01"
    portgroup         = local.portgroup.dmz01
    datastore_cluster = local.storage_cluster.prod
    domain            = "node.dmz01.noroutine.me"
    network           = local.network.dmz01
    netmask           = "255.255.255.0"
    gateway           = "10.0.14.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  lab01 = {
    folder            = "dc-lab01"
    portgroup         = local.portgroup.lab01
    datastore_cluster = local.storage_cluster.stage
    domain            = "node.lab01.noroutine.me"
    network           = local.network.lab01
    netmask           = "255.255.255.0"
    gateway           = "10.0.21.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  lab02 = {
    folder            = "dc-lab02"
    portgroup         = local.portgroup.lab02
    datastore_cluster = local.storage_cluster.stage
    domain            = "node.lab02.noroutine.me"
    network           = local.network.lab02
    netmask           = "255.255.255.0"
    gateway           = "10.0.22.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  lab03 = {
    folder            = "dc-lab03"
    portgroup         = local.portgroup.lab03
    datastore_cluster = local.storage_cluster.stage
    domain            = "node.lab03.noroutine.me"
    network           = local.network.lab03
    netmask           = "255.255.255.0"
    gateway           = "10.0.23.1"
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  lab04 = {
    folder            = "dc-lab04"
    portgroup         = local.portgroup.lab04
    datastore_cluster = local.storage_cluster.stage
    domain            = "node.lab04.noroutine.me"
    network           = local.network.lab04
    netmask           = cidrnetmask(local.network.lab04)
    gateway           = cidrhost(local.network.lab04, 1)
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  lab05 = {
    folder            = "dc-lab05"
    portgroup         = local.portgroup.lab05
    datastore_cluster = local.storage_cluster.stage
    domain            = "node.lab05.noroutine.me"
    network           = local.network.lab05
    netmask           = cidrnetmask(local.network.lab05)
    gateway           = cidrhost(local.network.lab05, 1)
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

  prod01 = {
    folder            = "dc-prod01"
    portgroup         = local.portgroup.prod01
    datastore_cluster = local.storage_cluster.prod
    domain            = "node.prod01.noroutine.me"
    network           = local.network.prod01
    netmask           = cidrnetmask(local.network.prod01)
    gateway           = cidrhost(local.network.prod01, 1)
    nameserver        = "10.0.10.34"
    puppet            = "10.0.10.4"
  }

}
