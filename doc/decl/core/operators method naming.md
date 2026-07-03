# [[decl/core/Operators Overloading|Operators Overloading]] method naming

some targets languages does not support operator overloading, or back-quoting for arbitrary names in code, so require some operator metods renaming:

- unary prefix
	- `-a` neg
	- `+b` pos
- binary
	- math
		`+` add
		`-` sub
		`*` mul
		`/` div
		`^` pow
		`%` mod
	- comparison
		- `==` eq
		- `!=` neq
		- `<` lt
		- `<=` lte
		- `>` gt
		- `>=` gte
	- boolean
- access
	- `a[]` get
	- `a[]=b` set
- [[decl/core/interpolation|interpolation]]
	- `$` str
	- `?` dump
