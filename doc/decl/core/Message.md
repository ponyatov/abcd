# Message
## [[decl/core/Actor|Actor]] message

```decl
actor Node {
    init name ?dst
	timer 1s {               // periodic timer
		if dst               // if self.node != undef
			dst!ping }       // send `ping` message
			
	ping { src!ping }        // on `ping` answer `pong`
	pong { log << _ }        // on `pong` log message
}

n1 = Node 1
n2 = Node 2 n1
```

```decl
class Message {
	src:actor        // sender
	dst:actor|group  // receiver
	id:uniq<uint>    // unical message id
	ts:timestamp     // send time marker
	sel:name         // message selector (actor/object method name)
	data:?any        // method parameters (allows API calls checking)
}
```
- in message handler
	- _ bound to whole message
	- local variables src, dst,... set to message fields

- [[core/js/Message]]
