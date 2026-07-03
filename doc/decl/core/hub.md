# hub
## embedded server specification

```decl

class Hub: HWSection {
    platform = HW('rpi::(cm4|cm5)')
    servers = [MQTT,Redis,Logger]
}


```
