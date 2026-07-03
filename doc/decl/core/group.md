# group
## [[decl/core/Actor|Actor]]s group

```decl
class Group: Actor[] {
	init topic              // register as topic on external MQTT broker
	policy = enum {         // message policy
		default<all>        // all members
		idles               // all in idle state
		random              // shuffle message to any member
		last                // last used dst
		roundrobin          // next dst
		balance             // less loaded dst
		idle                // single in idle state
		busy                // most loaded
		sticky<key>         // key such as uid, session,..
		least<n>            // at least n members
	}
	reg   actor:Actor       // register in a group
	unreg actor:Actor       // remove from group
	mon   actor:Actor       // invisible subscribe
}

glob all = Group<*:Actor>   // all actors in a system
```

```decl
// send to group with custom policy
workers.idles!shutdown  // free resources used by unloaded workers
all.random!kill         // test system for faults
```

- [[decl/core/pubsub|pubsub]]

### MQTT & topics

- proxy [[decl/core/group|group]] on external [[#Broker]]

```decl
power:group   // variable creation with type/class: class.name = var.name
power.sub log // subscribe logger to power-meters message bus
```

- for tree-like topic sets group must be created obviously with specific subname path:
	```decl
	state:group 'Machine/States' // with given topic name
	```
	- decl has no concept of hierarchical topics/subgroups now


- [[decl/core/group|group]]
- [[decl/js/group]]
- [[decl/net/mqtt|mqtt]]
