# defer

Schedules a cleanup action to run when the current block/function exits (even on error):

```decl
defer { cleanup() }
```

- [[decl/js/defer]]

```decl
fn process file:str {
    f = open file 'r'
    defer { f.close }         // runs when function returns
    
    data = f.read
    if data.empty { return }  // f.close still runs
    process data
}                             // f.close also runs here
```

### Multiple defers

```decl
fn complex {
    a = acquire A
    defer { a.release }  // runs 3rd
    
    b = acquire B
    defer { b.release }  // runs 2nd
    
    c = acquire C
    defer { c.release }  // runs 1st
    
    // LIFO order: C, then B, then A
}
```

### with single expression

```decl
defer out << "cleanup done"
defer mutex.unlock
defer file.flush, file.close  // multiple actions
```
