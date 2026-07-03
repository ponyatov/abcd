# validate
## validate input data **before** [[decl/core/setter|setter]] call

```decl
class Labuba {
	name {
		validate value -> bool {
			value.match r'[A-Z][a-z]+'
		}
	}
}
```

[[core/js/validate]]
