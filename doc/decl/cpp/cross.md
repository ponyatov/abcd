# multitarget C/C++ project

## files

```
bin/
lib/
	inc/
		lib.hpp
	src/
		lib.cpp
inc/
	app.hpp
src/
	app.cpp
	app.lex
	app.yacc
hw/
	inc/
		hw.hpp
	pc/
		inc/
			pc.hpp
cpu/
	inc/
		cpu.hpp
	i5/
		inc/
			i5.hpp
arch/
	inc/
		arch.hpp
	x86_64/
		inc/
			x86_64.hpp
	i386/
		inc/
			i386.hpp
os/
	inc/
		os.hpp
```

## GNU make

- `Makefile`

```Makefile
# var
APP = $(notdir $(CURDIR))

# cross
HW   ?= pc
include hw/$(HW)/$(HW).mk
include cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include os/$(OS)/$(OS).mk

# src
C += $(wildcard  src/*.c* lib/src/*.c*)
C += $(wildcard   hw/$(HW)/src/*.c*)
C += $(wildcard  cpu/$(CPU)/src/*.c*)
C += $(wildcard arch/$(ARCH)/src/*.c*)
C += $(wildcard   os/$(OS)/src/*.c*)
H += $(wildcard  inc/*.h* lib/inc/*.h*)
H += $(wildcard   hw/$(HW)/inc/*.h*)
H += $(wildcard  cpu/$(CPU)/inc/*.h*)
H += $(wildcard arch/$(ARCH)/inc/*.h*)
H += $(wildcard   os/$(OS)/inc/*.h*)
```

- `hw/pc/pc.mk`

```Makefile
CPU ?= i5
CFLAGS += -DPC
```

- `cpu/i5/i5.mk`

```Makefile
ARCH = x86_64
CFLAGS += -DX86_64
```

- `arch/x86_64/x86_64.mk`

```Makefile
OS ?= linux
CFLAGS += -DX86_64
```

- `os/linux/linux.mk`

```Makefile
CFLAGS += -DLINUX
```
