# thread

```decl
class thread {
	tid:int        // thread id
	tname:?str     // optional thread symbolic name
	pid:int        // parent process id
	mem:&Memory    // interop via shared memory allowed (for efficiency)
}
```
