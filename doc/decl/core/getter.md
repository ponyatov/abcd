# getter methods

- automatically generated for public fields
- can be defined manually for doing special things
- can be defined with `=undef` for disabling access
- access methods grouped with every property using {} (for code locality)
- field name omitted, used generic pseudo-names get,set

```decl
class Labuba {
	name: str = 'Mumba'                      // with default value
	{
		get -> str     { '${name}'        } // custom getter
		set value:str  { self.name = name } // custom setter
	}
}
```

[[core/js/getter]]
