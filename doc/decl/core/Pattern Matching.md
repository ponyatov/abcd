# Pattern Matching

[[decl/core/Pattern Matching|Pattern Matching]] (сопоставление с образцом) — это 
- check a value against patterns (top to bottom, first match wins)
- extract data from complex structures in one step
- evaluate expression for matched branch and return its value as match result

Вместо цепочки `if` или мотни из if-else на несколько экранов вы пишете одно выражение `match`:

```decl
match value
| 0 -> "zero"
| 1 -> "one"
| 2 -> "two"
| _ -> "many"
```

`->` аналогична такому же элементу в синтаксисе определения функции, и обозначает return: возврат результата вычисления правой части ветки match-выражения

## легко читаемая замена портянки if/else

```decl
fn age years:uint -> str {
    if лет < 0 {
        "Ошибка"
    } else {
        if лет < 3 {
            "Младенец"
        } else {
            if лет < 12 {
                "Ребенок"
            } else {
                if лет < 18 {
                    "Подросток"
                } else {
                    if лет < 60 {
                        "Взрослый"
                    } else {
                        "Пожилой"
                    }
                }
            }
        }
    }
}
```
сравните с этим:
```decl
fn age years:uint -> str {
    match years
    | n when n < 0 -> "Ошибка типа" // мы декларировали как беззнаковое
    | 0..2   -> "Младенец"
    | 3..11  -> "Ребенок"
    | 12..17 -> "Подросток"
    | 18..59 -> "Взрослый"
    | _      -> "Пожилой"
}
```

### подстановка через переменные

Когда вы пишете `match выраражение`, вы можете **захватить** само значение выражения, и его компоненты (для нескалярных данных) в локальные переменные используя шаблоны, и сразу использовать их:

```decl
match expr
| n:int -> "{n} is number"
| s:str -> '{s} is a string'
| b:bool -> 'boolean {b}'
| _ -> '{_} is something strange'
```

## `_`

 - `_` в левой части ветви является аналогом `case {default:}` в других языках:
	 - ветка выбора по умолчанию, если другие варианты не подошли
 - `_` в правой части соответствует значению `expr`
	 - чтобы в качестве аргумента `match` можно было использовать не именованную переменную, а произвольное выражение
	 - и подставлять значение этого выражения в нужное место

```decl
// Без переменной _ пришлось бы делать так: создавать временную переменную,
// и каждый раз придумывать ей имя только для того чтобы сослаться в коде
tmp = complex_expression()
match tmp
| 0 -> "zero"
| n:int -> "number: " + n
| _ -> 'какая-то неизвестная фигня: ' + _
```

## Type Patterns

process value in dependent of its type:

```decl
match expr
| n:int   -> "{n} is number"
| s:str   -> '{s} is a string'
| b:bool  -> 'boolean {b}'
| _       -> '{_} is something strange'
```

## Range Patterns

```decl
fn age years:uint -> str {
    match years
    | 0..2   -> "Baby"
    | 3..11  -> "Child"
    | 12..17 -> "Teen"
    | 18..59 -> "Adult"
    | _      -> "Senior"
}
```

## Guard Clauses

- `when` keyword expands pattern with boolean expression for conditional match

```decl
match value
| n when n < 0     -> "negative"
| n when n == 0    -> "zero"
| n when n > 0     -> "positive"
```

## Destructuring

- expand composite data into separate elements

### [[decl/core/tuple|tuple]]

```decl
let point = (10, 20)
match point
| (0,0)      -> "origin"
| (x,0)      -> "on X axis at {x}"
| (0,y)      -> "on Y axis at {y}"
| (x,y)      -> "point ({x},{y})"
```

### [[decl/core/vec|vector]]

```decl
match vec
| [||]          -> "empty"
| [| x |]       -> "single: {x}"
| [| x ; y |]   -> "pair: {x} {y}"
| [| x ; .. |]  -> "starts with {x}"
```

### Class Fields

```decl
class Point { x:float y:float }

match p:Point
| {x=0,y=0} -> "origin"
| {x=0}     -> "on Y axis"
| {y=0}     -> "on X axis"
| {x,y}     -> "({x},{y})"
```

## `match` as Expression

Every match returns a value, usable anywhere:

```decl
let description = match code
| 200 -> "OK"
| 404 -> "Not Found"
| _   -> "Error {code}"
```

## matching `let`

`var`/`let` can also use pattern matching for destructuring and binding variables in one step.

```decl
let (x, y) = (10, 20)                  // x=10, y=20
let [| a ; b ; c |] = [| 1 ; 2 ; 3 |]  // a=1, b=2, c=3
let {name, age} = person               // extracts fields from class/object
```

Ignoring Values with `_`

```decl
let (x, _) = (10, 20)       // x=10, second ignored
let (_, _, z) = (1, 2, 3)   // z=3
```

Class Field Extraction

```decl
class Person {
    name:str
    age:int
    city:str
}

// in place of init() method we can construct in F#/OCaml style:
let alice = Person { name="Alice" age=30 city="NYC" }

// extract specific fields
let {name, age} = alice     // name="Alice", age=30
let {city} = alice          // city="NYC"
```

with Type Annotations

```decl
let x:int = 42
let (a:float, b:float) = (3.14, 2.71)
let {name:str, age:int} = person
```
