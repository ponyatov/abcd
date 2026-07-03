# tuple
# compile to JS

```decl
let point = (10, 20)
let x = point[0]
```
- by default: compile to [[js/array|Arrays]]
	- most low-level, V8 optimizes heavily
```js
let point = [10, 20];
let x = point[0];
```

## homogeneous numeric tuples

```decl
let rgb:u8(3) = (255, 128, 0) // tuple bytes
let temp = (98.6, 40.2)       // all floats
```
- compiles into typed arrays
```js
let rgb = new Uint8Array([255, 128, 0]);
let temp = new Float32Array([98.6, 40.2]);
```

## Tuples with named keys

```decl
let rgb = (r: 255, g: 128, b: 0)
let person = (name: "Alice", age: 30, height: 1.65)
let point3d = (x: 10.5, y: 20.3, z: 5.0)
```
```js
let rgb = {r: 255, g: 128, b: 0};
let person = {name: "Alice", age: 30, height: 1.65};
let point3d = {x: 10.5, y: 20.3, z: 5.0};
```
