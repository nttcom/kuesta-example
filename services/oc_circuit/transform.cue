package oc_circuit

import (
	ocdemo "github.com/nttcom/kuesta-example/pkg/ocdemo"
)

#Input: {
	// kuesta:"key=1"
	vlanID: uint32
	endpoints: [...{
		device: string
		port:   uint32
	}]
}

#Template: {
	input: #Input

	output: devices: {
		for _, ep in input.endpoints {
			"\(ep.device)": config: {
				ocdemo.#Device

				let _portName = "Ethernet\(ep.port)"
				Interface: "\(_portName)": SubInterface: "\(input.vlanID)": {
					Ifindex:     ep.port
					Index:       input.vlanID
					Name:        "\(_portName).\(input.vlanID)"
					AdminStatus: 1
					OperStatus:  1
				}

				Vlan: "\(input.vlanID)": {
					VlanId: input.vlanID
					Name:   "VLAN\(input.vlanID)"
					Status: ocdemo.#Vlan_Status_ACTIVE
					Tpid:   ocdemo.#OpenconfigVlanTypes_TPID_TYPES_UNSET
				}
			}
		}
	}
}
