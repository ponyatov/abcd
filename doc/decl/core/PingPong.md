# pingpong

- [[decl/core/protocol|protocol]]

```decl
protocol PingPong {

	state {                                     // protocol's state machine
		idle -> beacon -> ping -> wait -> idle  // periodic
		idle -> recv   -> pong -> idle          // answer on pings
	}

	// common message fields
	msg {
		src:Node
		dst:Node
		id:u32 | uniq            // unical value constraint
		ts:TimeStamp = now
		msg:str = Self.lower     // inherit from message name
	}
	
    msg ping
    msg pong
}
```

[[decl/core/guard]]
[[core/js/PingPong]]
