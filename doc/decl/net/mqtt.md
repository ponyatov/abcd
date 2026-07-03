# mqtt

```decl
// MQTT брокер
sw Mosquitto  { apt='mosquitto' }
protocol MQTT { broker=default<Mosquitto> }

class MQTTBroker: Broker {
	init ?name connect='mqtt://localhost:1883' { connect }
	connect {
	}
	disconnect {
	}
}
```

- JS
```sh
npm add mqtt
```
```json
    "dependencies": {
        "mqtt": "^5.15.1"
    }
```
- C++
```apt
libmosquittopp-dev
```

- [[decl/js/mqtt]]
