# host
## default developer's workstation config

```decl
// default developer's workstation config
glob host {
	HOST    = 'x86_64-linux-gnu'
	arch    = x86_64
	os      = linux
	variant = 'Debian GNU/Linux 12'
	
	// add dev.user with: sudo usermod -a -G dialout $USER
	groups  = [dialout,plugdev,wireshark]
}
```
