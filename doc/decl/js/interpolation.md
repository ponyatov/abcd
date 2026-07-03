# [[decl/js/interpolation|interpolation]]
## implementation in JS using formatted strings

```decl
class Vector2D {
	x,y: float = 0.0
	init x:num y:num -> Self {
        self.x = x.float;
        self.y = y.float;
    }

    `$` { `{x}@{y}` }
    `?` { `(Vector2D {x} {y})` }
    json { '{type:{Self},{x?},{y?}' }
}
```
```js
class Vector2D {
    constructor(x = 0.0, y = 0.0) {
        this.x = Number(x);
        this.y = Number(y);
    }

    toString() {
        return `${this.x}@${this.y}`;
    }
    
    dump() {
	    ???
    }

    toJSON() {
        return {
            type: this.constructor.name,
            x: this.x,
            y: this.y
        };
    }
}
```

- `$` compiles to `toString` method
- `?` must be compiled to `dump` method returns string, which evaluates back to serialized object
- `json` compiles to `toJSON` method
