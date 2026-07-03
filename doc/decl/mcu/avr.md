# avr
## support for legacy devices

```files
cmake/
    avr-none.cmake
```

- `decl` must generate .ino files with Arduino-compatible code

```decl
os arduino {}
arch avr8 {}
cpu atmega { arch=avr8; os=arduino }
cpu atmega32: atmega { flash=32K }
cpu atmega64: atmega { flash=64K }
```
