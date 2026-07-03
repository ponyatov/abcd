# Operators Overloading
## compile to JS

- JS has no any operators overloading
	- so operator methods must be [[decl/core/operators method naming|renamed]] in python style
	- if a and b is not primitive types:
		- `op a` must be rewritten in a form of `a.op()`
		- `a op b` must be rewritten in a form of `a.op(b)`
		- for primitive types should be generated native JS expressions with infix syntax

```decl
class Vector2D {
	float x,y
	`$` self -> '{x}@{y}' // Smalltalk-style vector/point
	`+` self -> Self { self }
	`-` self -> Self { Self -self.x -self.y }
	`+` self other -> Self { Self self.x+other.x self.y+other.y }
}
```
```js
class Vector2D {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    toString() {
        return `${this.x}@${this.y}`;
    }
}
```
