# [[org/MAS|MAS]] reference project
## Industrial Vending Machine (demo)

стенд состоит из следующих узлов:
- источник питания [[DRS#240-12]]
- hub: Waveshare [[CM4-ETH-RS485-BASE-B]]
- i/o controller: [[KinCony]] [[KC868-A16]] / [[ESPHome]]
- QR reader: [[RusGuard]] [[R10-MF]]

```decl
net {
	ip = 10.130.2.9/24
	gw = 10.130.2.254
}

bus mbus: MODBUS { baud = 115200; mode = 8n1 }

node DRS_240_12: DRS {
	vin = 230v
	bat = lead_acid  // for UPS mode
	vout = 12v
	pout = 240w
	modbus.id = 131
}

node hub: CM4_ETH_RS485_BASE_B {
	compute_module = cm4
	ip = .11
	os = linux
	sw = [nodered,greylog]
	rs485[4] = [0:nil 3:mbus 4:nil 5:nil]
	rs485[3].device = '/dev/ttyAMA3'
}

node esphome: KC868-A16 {
	modbus.id = 51
	ip = .51
}
```
