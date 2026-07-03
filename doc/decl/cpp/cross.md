# multi-target C/C++ project

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

# tool
TCC = $(TARGET)-gcc
TXX = $(TARGET)-g++
TLD = $(TARGET)-ld

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
OS     ?= linux
TARGET ?= x86_64-linux-gnu
CFLAGS += -DX86_64
```

## Linux

- `os/linux/linux.mk`

```Makefile
CFLAGS += -DLINUX
```

### `ARCH != HOST`

если целевая платформа не совпадает с платформой разработки `BUILD=x86_64` но при этом поддерживается ядром Linux, применяется сборка
- кастомного кросс-компилятора С/С++
- ядра Linux
- стандартной библиотеки [[uclibc]]
- набора базовых UNIX-утилит [[busybox]]
- и исполняемого файла приложения, интегрированного в загрузочный образ файловой системы ([[Linux/initrd|initrd]])
- полученный образ может быть запущен под эмулятором QEMU для отладки и тестирования

дополнительные каталоги для кросс-компиляции специализированного embedded Linux:
```
cross/           # кросс-компилятор С/С++
root/            # корневая файловая система (initrd)
bin/
	$(HW)-linux.iso  # загрузочный образ (CDROM/USBdrive для x86)
```

#### пакеты

- библиотеки критичные для компиляции GNU gcc
	- [[math/GMP]]
	- [[math/MPFR]]
	- [[math/MPC]]
- GNU gcc
	- [[binutils]]
	- GCC
	- GDB
- минимальный embedded Linux
	- LINUX
	- [[uclibc]]
	- [[busybox]]
