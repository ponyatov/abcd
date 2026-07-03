# [[decl/core/str|string]] interpolation

- `{expr}` evaluates as `(expr).str` with stringify `$` str method 
- `{expr?}` evaluates as `(expr).dump` print in `decl` or target language literal syntax (parens, delimiters,..) using `?` dump method
- `{_expr}` for prints in form `expr:$expr`
- `{expr?}` for prints in form `expr:?expr`

```decl
let empty_list   = []
var heterogenous = [ 1 ; 2.3 ; 'hello' ];

out << `empty_list:{empty_list}` // with string interpolation
out << `${empty_list}`           // ${v} interpolates into 'v:value'
```

> [[decl/js/interpolation]]

## access methods

- for props (fields) custom access methods can be defined for special formatting
