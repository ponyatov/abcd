# `fini`
## destructor = finalizer

```decl
class bebebe {
  // or ~bebebe tilda prefix
  fini {
	  match value
	  | s:str -> drop d  // free string memory
	  | _ -> ()          // other value types not need special finalize
  }
}
```
- has no arguments and return type
- `~class_name` or fixed `fini` name
