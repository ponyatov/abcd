# UFCS
## Unified Call Syntax

UFCS is a feature that blurs the line between free functions (not tied to a type) and member methods: it allows you to call a function using the dot notation commonly associated with object-oriented programming without need function to be a class or trait/type method:

- any free function can be called as a method
	- in case passing object as a first argument
	- and other optional arguments

`object.do(someting) <~> do(&object,something)`

- enables natural **method chaining**, allowing complex operations to be written as a clear, linear dotted pipeline (e.g., `data.filter().map().sort()`) instead of nested function calls
- Programmers can use their IDE's code completion after typing a dot (`.`) to see all applicable functions, including free functions that take the object as their first argument
