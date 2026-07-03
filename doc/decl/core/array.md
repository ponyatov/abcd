# array
## fixed size array type

```decl
const Msz = 0x10000   // main memory size in FORTH-like VM (64K bytes max)
var M:u8[Msz] = undef // place byte blob in .bss
```
- `var name:type[size]` fixed-size [[decl/core/array]] type
