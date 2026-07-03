# Broker
## external MQTT server for [[decl/core/group|group]]s

```decl
class Broker: Server {
	static glob:Broker            // system-wide message broker (singleton)
	connect: {                         // connection config
		ip       = localhost
		port     = 1883
		protocol = MQTT
		library  = mqttc|paho|libmosquitto
	}

	topic:map<name, topic>             // model: topics registry
}
```

- [[decl/vending/иерархия топиков MQTT]]
