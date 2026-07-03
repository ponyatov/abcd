# Short-circuit operators

```decl
// logical AND (stops at first false)
if valid && exists && active { process }

// logical OR (stops at first true)
if ready || pending || retry { handle }
```
