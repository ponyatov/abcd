# Loops

## infinite loop

```decl
var running = true
loop {
    msg = mailbox.pop
    match msg
    | "quit" -> running = false; break // break from current loop
    | _      -> process msg
}
```

## range loops

```decl
for i in 0..10 {
    out << i
}

for i in 0..10 step 2 {
    out << "even: {i}"
}

for i in 10..0 step -1 {
    out << "countdown {i}"
}
```

## container iteration

```decl
let numbers = [| 1 ; 2 ; 3 ; 4 ; 5 |]
for n in numbers {
    out << "value: {n}"
}

for idx, val in numbers {
    out << "[{idx}] = {val}"
}

let dict = { "a":1 ; "b":2 ; "c":3 }
for key, value in dict {
    out << "{key} -> {value}"
}
```

## Loop Control

- `break` - exit loop immediately
- `continue` - skip to next iteration

## Conditional Loops

- pre-condition: `while` / `until` (0+ loops)
```decl
var i = 0

/// check before loop body
while i < 10 { out << i++ }
until i >= 10 { ... }
```
- post-condition: `do-while` / `do-until` (1+ loops)
```decl
do { input << in } while ! (validate input)
do { input << in } until   (validate input)
```
