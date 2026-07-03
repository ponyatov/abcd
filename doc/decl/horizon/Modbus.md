# Modbus Protocol Components

- [[srvModbusBase]] - Base Modbus implementation
- [[srvModbusClient#RTU]] - Modbus RTU client
- [[srvModbusClient#TCP]] - Modbus TCP client
- [[srvModbusClient#ROT]] - Modbus ROT client
- [[srvProxyModbus#RTU]] - Modbus RTU proxy
- [[srvProxyModbus#TCP]] - Modbus TCP proxy
- [[srvProxyModbus#ROT]] - Modbus ROT proxy

```decl
module HorizonServer {
    modbus {
        srvModbusBase           // base Modbus implementation
        
        // Clients
        srvModbusClientRTU      // Modbus RTU client
        srvModbusClientTCP      // Modbus TCP client
        srvModbusClientROT      // Modbus ROT client
        
        // Proxies
        srvProxyModbusRTU       // Modbus RTU proxy
        srvProxyModbusTCP       // Modbus TCP proxy
        srvProxyModbusROT       // Modbus ROT proxy
    }
}
```
