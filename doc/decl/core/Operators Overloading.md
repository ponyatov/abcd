# Operators Overloading

`decl` supports operator overloading through using special method names -- quoting backticks allow to set language item value with any chars:

```decl
class Labuba {
	name:str
	init name:str
	`+` self other:Self -> Self { Labuba (self.name mix other.name) }
}
```

![[operators method naming]]

> [[decl/js/Operators Overloading]]
