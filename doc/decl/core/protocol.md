# protocol

```decl
class Protocol
    RFC:?int
    ISO:?int
    beacon = 1<s>           // ping/pong interval to keep live
    
    actor {                 // common elements
	    init peer:Actor     // p2p require two nodes knows each other
	    timeout = 500<ms>
	    
	    on send { self.peer << 'ping' }
	    on recv { self.peer << 'pong' }
    }
    client {}               // any methods can be called directly
    server {}               // and indirectly by async message send
```
- [[decl/net/modbus|modbus]]
- [[decl/net/measure]]
