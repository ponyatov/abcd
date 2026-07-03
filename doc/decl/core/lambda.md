# lambda blocks
## unnamed [[decl/core/fn|fn]] with optional parameters

- uses block syntax form:
```decl
{ ... }
{ var | ... var ... }
{ a b | ... a ... b ... }
```

- in use with data collection methods lambda arguments can be omitted and used with `_` `_1` `_2` ... variables:
```decl
items.filter { _.value > 42 } // omitted: { item | item.value > 42 }
```
