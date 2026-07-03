# map
## compile to JS

```decl
fn nop  {}
fn halt { sys.exit(0); }
let vocabulary = {
	nop: nop
	halt: halt
	hello: { out << 'Hello' }
}
```
```js
function nop() {}

function halt() { 
    process.exit(0); 
}

let vocabulary = {
    nop: nop,
    halt: halt,
    hello: function() { console.log('Hello'); }
};
```
