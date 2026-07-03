# lazy loading

```decl
class {
	name {
		// runs once if name == None
		lazy {
			// any expensive operation
			name = db.query('select name from ...') 
		}
	}
}
```
