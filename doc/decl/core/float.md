# float
## floating point numbers

- default type: 'float = f32'

```decl
type float: num {}       // generic floating point
type f32,f64: float {}   // float/doble
type f16: float {}       // short float for fast & compact MCU math
```

## epsilon

```decl
// defined by IEEE 754 single-precision floating-point standard
const float::epsilon = 2^-23:float // least significant mantissa bit
```
