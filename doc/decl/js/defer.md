# [[decl/js/defer|defer]]
## in JS

```decl
defer { cleanup() }
```
```js
try {
    // function body
} finally {
    cleanup();
}
```

```decl
fn process file:str {
    f = open file 'r'
    defer { f.close }         // runs when function returns
    
    data = f.read
    if data.empty { return }  // f.close still runs
    process data
}                             // f.close also runs here
```
```js
function process(file) {
	let f = open(file, 'r');
	let _deferred = [];
	_deferred.push(() => f.close());
	try {
		let data = f.read();
		if (data.empty) { while (_deferred.length) _deferred.pop()(); }
		processData(data);
		}
	} catch (e) {
		// cleanup still runs on error
		while (_deferred.length) _deferred.pop()();
		throw e;
	}
	// cleanup runs on normal exit
	while (_deferred.length) _deferred.pop()();
}
```
