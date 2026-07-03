# Conditional Statements

- `if` statement

```decl
if x > 0 {
    "positive"
} else {
    "negative or zero"
}
```

- `if` expression

```decl
let status = if x > 0 { "ok" } else { "error" }
```

- chained `if`
	- not recommended, prefer [[decl/core/Pattern Matching|Pattern Matching]]

```decl
if score >= 90 {
    grade = 'A'
} else if score >= 80 {
    grade = 'B'
} else if score >= 70 {
    grade = 'C'
} else {
    grade = 'F'
}
```

