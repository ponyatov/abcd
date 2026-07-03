# HorizonServer
## [[horizon/horizon|Horizon]] platform core

```decl
module HorizonServer {
	gitref = https://github.com/Konkery/HorizonServer
	core    {}
	logging {}
	modbus  {}
	snmp    {}
	mqtt    {}
	device  {}
}
```

## [[HorizonServer.files]]

## [[decl/horizon/Core Components]]
## [[decl/horizon/Logging]] & Monitoring
## [[decl/horizon/Modbus]] Protocol Components
## [[decl/horizon/SNMP]] Components
## [[decl/horizon/MQTT]] Components
## [[decl/horizon/Device]] & Hardware Components


## Motor Control Components

- [[srvHBridgeMotor]] - H-Bridge motor control
- [[srvMatrixMotorCtrl]] - Matrix motor controller
- [[srvProxyHBridgeMotorCtrl]] - H-Bridge motor control proxy
- [[srvProxyMatrixMotorCtrl]] - Matrix motor controller proxy

## Sensor & Actuator Components

- [[srvChannelActuator]] - Actuator channel
- [[srvSensorChannel]] - Sensor channel
- [[srvProxyChannel]] - Channel proxy

## Web & Network Components

- [[srvWSClient]] - WebSocket client
- [[srvProxyWS]] - WebSocket proxy
- [[srvProxyRpi]] - Raspberry Pi proxy
- [[srvProxyZ2MClient]] - Zigbee to MQTT client proxy

## Industrial Protocols

- [[srvRLNLS]] - RLNLS protocol
- [[srvProxyRLNLS]] - RLNLS proxy

## Data Provider Components

- [[srvProviderMDB]] - MDB data provider

## Emulation & Testing

- [[srvVendingMachineEmu]] - Vending machine emulator

## Messaging & Integration

- [[srvTelegramBot]] - Telegram bot integration
