# map
## Associative Array (key/value)

```decl
type hashable {
	fn hash self -> int
	fn quals other -> bool
}

container map<K:hashable,V:any> {}
```
