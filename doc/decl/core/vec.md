# vec
## Vector

- Memory layout: Contiguous array
- Size per element: Just the element
- Random access: $O(1)$ via `[index]`
	- all items must have equal size on memory
- Insert/delete at end: $O(1)$ amortized
- Insert/delete at middle:	$O(n)$ - shifts elements
- Cache locality: Excellent (sequential)
- Memory overhead: Minimal

```decl
let empty_vec = [||]
var num_vec = [| 1 ; 2 ; 3 |]
// var heterogenous: can't be used as all items must be same type
```

- ';' splits items
- ',' prohibited as used in [[decl/core/tuple]]

- [[decl/js/vector]]
