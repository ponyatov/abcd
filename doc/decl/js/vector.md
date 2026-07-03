# vector
## compile to JS

```decl
let empty_vec = [||]
```
```js
let empty_vec = []; // generic `Array` fallback
```

## homogeneous numeric vectors

```decl
var num_vec = [| 1 ; 2 ; 3 |]
num_vec[0] = 42
```
```js
let num_vec = new Int32Array([1, 2, 3]);
num_vec[0] = 42;
```
