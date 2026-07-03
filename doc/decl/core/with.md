# with
## resource management with {} blocks

Any type can be usable with `with`, if it implements internal resource management in:
- init() acquire some hidden resources
- fini() release acquired

## with

```decl
with f = open "tmp/hello.txt" 'w' {
    f << 'Hello'
    # file automatically closed here via .fini method
}
```
```decl
// multiple resources
with a = acquire A, b = acquire B {
    // use both resources
} // released in reverse order at end of {} block
```

## [[decl/core/Loops|Loops]]
## [[decl/core/defer]]
