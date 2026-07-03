# Distributed Computing

- `decl` is built on an Actor Model 
- Heterogeneous Nodes
- Cross-Node Messaging
	- implies automatic serialization/deserialization of messages sent between actors

## [[decl/core/PingPong]]

## props

- in distributed system any access runs over network calls:
	- unpredictable delay
	- sudden failures
	- data loss and timeouts (UDP and radio interconnect)
