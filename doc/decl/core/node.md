# node
## hardware or virtual computing node

- platform: heterogenous
- distributed

```decl
class node {
	hw:Hw              // concrete hardware device reference
	cpu:Cpu[]          // SMP allowed for fat nodes
	arch:Arch          // architecture selector
	mem:Memory[]       // can have 1+ memory regions
	process:Process[]  // comtutationally represents multiple processes
}
```
