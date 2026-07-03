# Classes and Objects

![[decl/core/Object]]

## fields and methods

- fields not available directly:
	- only [[decl/core/getter|getters]]/[[decl/core/setter|setters]] must be used ([[decl/core/automatic properties]])
- fields available from methods of sibled classes can be referenced directly without `self.` prefix
	- if has no mixes with method parameters of local variables
- methods is functions takes first argument as `self` reference to object
	- does not need `fn` prefix
- special methods:
	- [[decl/core/constructor|constructor]]
	- [[delc/core/destructor|destructor]]

 ## [[automatic properties]]

## hidden fields rational

- pros
	- open fields breaks incapsulation
	- can run custom code on load or store
	- allows triggers on data access or change
	- storage abstraction: external DB or any data providers can be used
	- extended cross-thread sync
- cons
	- low of boilerplate code in languages does not support props directly in syntax
	- too much boilerplate code even if props supported (overengeneered language design or no automatic props methods generation)
- getter
	- lazy init
	- virtual computable fields
- setter
	- runtime validation (format, range checking etc)
	- change notification code
	- dependent/computable fields
