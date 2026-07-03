# measure

- measurement units can be bound to variables, and numerical values

```decl
class measure: type {
	suffix:str = Self.name // default is measure class name
}
```
```decl
measure kg // kilogram
measure m  // meter
measure s  // second

measure N  // newton (kg m / s^2)

const g = acceleration_due_to_gravity <m/s^2>
```
```decl
// sample: Create values with units
let distance = 10.0<m>
let time     = 2.0<s>
let mass     = 5.0<kg>

// Derived unit automatically inferred
let velocity = distance / time   // float<m/s>

// Explicit derived unit
let force = 5.0<N>               // float<N>

// unit prefixes
let length = 5 nm               // nanometers
let memory = 16 GiB             // gibibytes
```
