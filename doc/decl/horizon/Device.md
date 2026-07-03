# Device & Hardware Components

- [[srvDevicesManager]] - Device management
- [[srvADAM]] - ADAM series industrial I/O modules
- [[srvKinCony]] - KinCony devices
- [[srvMLED]] - MLED displays
- [[srvMWDRS240]] - MWDRS240 modules
- [[srvCellLock]] - Cell lock controllers
- [[srvRpiClient]] - Raspberry Pi client

```decl
module HorizonServer {
    device {
        srvDevicesManager      // device management
        
        // Industrial I/O modules
        srvADAM                // ADAM series modules
        
        // Controllers and displays
        srvKinCony             // KinCony devices
        srvMLED                // MLED displays
        srvMWDRS240            // MWDRS240 modules
        
        // Security and access
        srvCellLock            // cell lock controllers
        
        // Single-board computers
        srvRpiClient           // Raspberry Pi client
    }
}
```
