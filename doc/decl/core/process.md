# process

```decl
class process {
	pid:int                 // process id
	pname:?str              // optional process name
	mem:Memory              // isolated memory (thread-shared)
	thread:Thread[]         // can have internal threads
	mailbox:queue<Message>  // async message processing income
}
```
