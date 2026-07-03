```decl
gui Theme {
	name:str
	font: {
		size: min<2mm>      // all texts must be readable
		family: monospace   // make the GUI close to console TUI
	}
}
```

```decl
theme print {
	background: transparent // on white paper
	color: on               // colors selected to good look in grayscale
}
```

```decl
theme dark {
	background: #222
	color: lightgreen;  // old style monitor emulation
}
```
