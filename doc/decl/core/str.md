# `str`
## Strings

```decl
type str
let hello:str = 'Hello World'
```

- 'single-ticks' and "double-ticks" string literals
	- 'multi-lines'
	- single [[decl/core/char]] type: `$c:char`
- [[interpolated strings]]
	- common escapes `\t\r\n\x`
	- w'raw strings' w/o escapes
- for interop & data exchange
	- b'single-byte C strings' null-terminated
	- u'utf8'
- [[decl/core/regexp|regexp]]
	- r'regexp'

## WCS-16
![[decl/reserved]]

```decl
type str:<len:u16,chars:u16[]> // = utf16le
```

counted [[WCS-16]] strings encoding used to maximize speed of string operations:
- len field + all chars has fixed `u16` size (no $O(n)$ scanning, )
	- fast non-equality compare using only starting `len:u16` field
- universal representation for most used world languages
- little-endian byte order as the most popular platforms
	- single machine commands for ld/st/cmp
- 64K max string length large enought for any apps

## [[interpolation]]
