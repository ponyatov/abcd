# bool
## boolean numbers

- `true`
- `false`
- non-zero numbers assumed `true`, else `false`:
	- int = 0
	- float < epsilon
- empty [[decl/core/Containers|Containers]] assumed `false`, else `true`
- empty string assumed false

```decl
type bool {
	grammar='true'>true|'false'>false
	bool(n:int) -> bool {n=0}
	bool(f:float) -> bool {f<float::epsilon}
}
```
- also: see [[decl/core/return]]
- [[decl/core/constructor]]
