# tuple

- ordered, fixed-size collection of elements that can have different types
- indexed by `[int]` or `var.name` for named fields

```decl
let point2d = (10, 20)               // two integer coordinates
var person  = "Alice", 30, 1.65      // name:str, int, float
let single  = (42,)                  // single element tuple
let rgb     = (r: 255, g: 128, b: 0) // with names fields
```
- ',' as item delimiter
- `()` optional

```decl
let x,y = point2d                   // expand with pattern match
var (r<=0xFF,g<=0xFF,b<=0xFF) = rgb // with value checking
```

- [[decl/js/tuple]]
