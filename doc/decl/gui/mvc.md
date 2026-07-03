# mv
## Model-View

`decl` uses simplified [[decl/core/gui|gui]] model with only two actors:

```decl
/// compiles to `class NameModel`
class Model: Actor { view = undef }

/// compiles to `class NameView`
class View: Actor,GUI {
	init model {
		self.model = model // view knows model
		model.view = self  // and model knows its view
	}
}
```

- [[decl/gui/counter]]
