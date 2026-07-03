# Functions

- free named functions
	- lambdas
	- local functions
- methods

```decl
fn optional_name [arguments] -> return_type {
	return value;
	last_expression // can be used w/o return keyword (good for tiny code)
}
```

## [[Unified Call Syntax]] (UFCS)
## no-parens

> DECL HAS NO PARENS!!! `()` in function/call syntax -- used only for expression or operand grouping

there is a feature proposed by some languages, that aims to allow any function definitions and calls to be written with more readable syntax:
- optional parens
	- no parents for calling no-argument functions
	- arguments can be splitted
- optional name: lambdas
- return type can be inferred and can be omitted

no-parens syntax and UFCS  is that they are distinct but highly complementary features: when combined, they create a programming experience that feels truly "fluent" and natural syntax

```decl
obj.size        // call .size() method w/o parameters
obj.value       // return from .value() getter
obj.value = 123 // set .value field with .value(n:int) setter
obj.scale 1.5   // no-parens call
```

## [[Multiple Dispatch]]

we can have multiple functions definition with the same name, which will be selected by arguments & return type pattern matching
