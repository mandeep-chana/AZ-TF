global_settings = {
  default_region = "region1"
  regions = {
    region1 = "australiaeast"
    region2 = "australiacentral"
  }
}

resource_groups = {
  hub_re1 = {
    name   = "vnet-hub-re1"
    region = "region1"
  }
}

virtual_wans = {
  vwan_re1 = {
    resource_group_key = "hub_re1"
    name               = "contosovWAN-re1"
    region             = "region1"

    # old inline syntax is still valid, but using the virtual_hubs = {} object is more future-proof.
    # hubs = {
    #   hub_re1 = {
    #     hub_name           = "hub-re1"
    #     region             = "region1"
    #     hub_address_prefix = "10.0.3.0/24"
    #     deploy_p2s         = false
    #     p2s_config         = {}
    #     deploy_s2s         = false
    #     s2s_config         = {}
    #     deploy_er          = false
    #     er_config          = {}
    #   }

    #   hub_re2 = {
    #     hub_name           = "hub-re2"
    #     region             = "region2"
    #     hub_address_prefix = "10.0.4.0/24"
    #     deploy_p2s         = false
    #     p2s_config         = {}
    #     deploy_s2s         = false
    #     s2s_config         = {}
    #     deploy_er          = false
    #     er_config          = {}
    #   }
    # }
  }
}

virtual_hubs = {
  hub_re1 = {
    virtual_wan = {
      key = "vwan_re1"
    }
    resource_group = {
      key = "hub_re1"
    }
    hub_name           = "hub-re1"
    region             = "region1"
    hub_address_prefix = "10.0.3.0/24"
    deploy_p2s         = false
    p2s_config         = {}
    deploy_s2s         = false
    s2s_config         = {}
    deploy_er          = false
    er_config          = {}
  }

  hub_re2 = {
    virtual_wan = {
      key = "vwan_re1"
    }
    resource_group = {
      key = "hub_re1"
    }
    hub_name           = "hub-re2"
    region             = "region2"
    hub_address_prefix = "10.0.4.0/24"
    deploy_p2s         = false
    p2s_config         = {}
    deploy_s2s         = false
    s2s_config         = {}
    deploy_er          = false
    er_config          = {}
  }
}