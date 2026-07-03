# Multiple Dispatch
## ad-hoc polymorphism

with Elixir-like pattern matching for function signatures

```decl
/// Area calculation for different shapes

fn area shape:Circle    -> float { math.pi * shape.radius ^ 2      }
fn area shape:Square    -> float { shape.side * shape.side         }
fn area shape:Rectangle -> float { shape.width * shape.height      }
fn area shape:Triangle  -> float { (shape.base * shape.height) / 2 }
```
- same function name
- differs with argument patterns
- `when` guard can be used to select by argument value range etc

pattern matching in function headers also destructure arguments:

```decl
/// Direct value matching
fn handle 0 -> "zero"
fn handle 1 -> "one" 
fn handle n:int when n > 0 -> "positive: {n}"
fn handle _ -> raise 'unknown'
```

```decl
/// Tuple destructuring
fn process (0,0)   -> "origin"
fn process (x>0,0) -> "on +X axis at {x}"
fn process (0,y)   -> "on Y axis at {y}" 
fn process (x,y)   -> "point ({x},{y})"
```

```decl
/// List/Vector matching
fn sum [||] -> 0
fn sum [| x |] -> x
fn sum [| x ; y |] -> x + y
fn sum [| x ; ..rest |] -> x + sum rest
```

## Message Handling in Actors

```decl
class MyActor: Actor {
    /// Handle different message types
    process self src "ping"   -> src ! "pong"
    process self src "status" -> src ! "ok"
    process self src "stop"   -> halt
    process _ _ msg -> log "unknown: {msg}"
}
```

## Return Type Dispatch

```decl
/// Same name, different return type
fn parse s:str -> int    { int(s) }
fn parse s:str -> float  { float(s) }
fn parse s:str -> bool   { s == "true" }

/// Usage with type annotation
let x:int   = parse "42"    // calls int version
let y:float = parse "3.14"  // calls float version
let z:bool  = parse "true"  // calls bool version
```
