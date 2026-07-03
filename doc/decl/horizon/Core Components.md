# Horizon Core Components

- [[srvProcess]] - Process management and orchestration
- [[decl/horizon/srvService]] - Base service framework
- [[decl/horizon/srvBus]] - Message bus core
- [[srvBusMsg]] - Bus message handling
- [[srvChannel]] - Communication channel abstraction
- [[srvUtils]] - Shared utilities (hash generation, state control)

```decl
module HorizonServer {
	core {
        srvProcess        // process management and orchestration
        srvService        // base service framework
        srvBus            // message bus core
        srvBusMsg         // bus message handling
        srvChannel        // communication channel abstraction
        srvUtils          // shared utilities (hash, state control)
        srvDevicesManager // device management
	}
}
```

## interaction diagram

```mermaid
flowchart TB
    subgraph Core["Core Components"]
        Proc["srvProcess<br/>Process Manager"]
        Serv["srvService<br/>Base Service"]
        Bus["srvBus<br/>Message Bus Core"]
        Msg["srvBusMsg<br/>Message Handler"]
        Chan["srvChannel<br/>Channel Abstraction"]
        Utils["srvUtils<br/>Hash/State Utilities"]
        DevMgr["srvDevicesManager<br/>Device Manager"]
    end

    subgraph External["External Systems"]
        HW["Hardware Devices"]
        Net["Network"]
        DB["Database/Config"]
    end

    %% Process to Service
    Proc -->|"creates & manages"| Serv
    Proc -->|"loads config from"| DB
    
    %% Service to Bus
    Serv -->|"uses"| Bus
    Serv -->|"sends/receives"| Msg
    
    %% Bus internal
    Bus <-->|"routes"| Msg
    
    %% Channel connections
    Bus <-->|"communicates via"| Chan
    Chan -->|"abstracts"| HW
    Chan -->|"abstracts"| Net
    
    %% Device management
    DevMgr -->|"controls"| HW
    DevMgr <-->|"uses"| Chan
    
    %% Utils support
    Utils -.->|"provides helpers to"| Proc
    Utils -.->|"provides helpers to"| Serv
    Utils -.->|"provides helpers to"| DevMgr
```
