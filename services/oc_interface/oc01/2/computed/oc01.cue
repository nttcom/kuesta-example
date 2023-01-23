{
	Interface: {
		Ethernet2: {
			Name:        "Ethernet2" @go(,*string)
			Description: ""          @go(,*string)
			Enabled:     false       @go(,*bool)
			AdminStatus: 1
			OperStatus:  1
			Type:        80
			Mtu:         9000 @go(,*uint16)
			Subinterface: {} @go(,map[string]*Interface_Subinterface)
		}
	} @go(,map[string]*Interface)
	Vlan: {} @go(,map[string]*Vlan)
}