# int
## integer numbers

- optional number literal type spec with `:`
	- `42:int` `0xFF:u8`
	- signed/unsigned decimal: `-12345:i32`
- default type: 'int = i32'
- hex: `0x` prefix
	- `$xx` form only for [[decl/core/char|char literals]]
- bin: `0b`
- oct: `0o`

```decl
// generic integer
type int: num {}         // generic int
type i8,u8: int<8>       // 8-bit signed/unsigned int
...
type i64,u64: int<64>    // max register size on x86_64
type i128,u128: int<128> // quad math (optional)
```
