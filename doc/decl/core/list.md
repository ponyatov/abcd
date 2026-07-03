# list
## List

- Memory layout: Non-contiguous, node-based
- Size per element: Element + two pointers (forward/back)
- Random access: $O(n)$ - no random access
- Insert/delete at end: $O(1)$
- Insert/delete at middle: $O(1)$ - if iterator known
- Cache locality: Poor (scattered nodes)
- Memory overhead: prev/next pointers (2 machine words)

```decl
let empty_list   = []
var heterogenous = [ 1 ; 2.3 ; 'hello' ];
```

- ';' splits items
- ',' prohibited as used in [[decl/core/tuple]]

> [[decl/js/list]]
