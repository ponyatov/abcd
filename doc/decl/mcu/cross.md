# cross
## cross-compilation is a first-class method

target specification has this components:

- `hw` concrete target hardware
    - `pc` generic x86 PC
    - `qemu386` emulated (virtualbox compatible)
- `cpu` concrete CPU/MCU used on `hw`
    - `i5` default for host PC
    - `i686` atom-based netbooks etc
    - `i386` retro computers
    - `stm32f4`
    - `lx107`
- `arch` generic architecture for `cpu`
    - `x86_64`
    - `i386`
    - `cortexm`
    - `xtensa`
- `os` target OS
  - `linux` embedded Linux
  - `bare` bare-metal
  - `rtos` FreeRTOS

```decl
class HW {}
class CPU {}
class ARCH {}
class OS {}
```

## [[x86]]

## [[cortex|Cortex-M]]

## [[esp32]]

## [[os]]

## cross source generation

specific code generates to this dirsectories:

```
hw/
    pc/
    qemu386/
cpu/
    i5/
    stm32f103c8t/
arch/
    i386/
    x86_64/
os/
    linux/
    bare/
    rtos/
```

every cross directory has:
```
X/
    inc/
        X.hpp
        *.hpp
    src/
        X.cpp
        *.cpp
```
