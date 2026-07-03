# make
## GNU make

```files
mk/
    *.mk
Makefile
```

```sh
mkdir mk
touch Makefile
touch mk/{var,tool,install,ai}.mk
```

## Makefile

```make
include mk/var.mk
include mk/tool.mk
include mk/install.mk
include mk/ai.mk
```

## mk/var.mk

```make
APP     = $(notdir $(CURDIR))
REL     = $(shell git rev-parse --short=4    HEAD)
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
NOW     = $(shell date +%y%m%d)
PEPS    = E26,E302,E305,E401,E402,E701,E702
WS      = $(shell lsb_release -si)
HW     ?= pc

ifeq ($(OS),Windows_NT)
	WS  = $(shell uname -o)
	EXE = .exe
else
	WS  = $(shell lsb_release -si)
	EXE =
endif
```

## mk/tool.mk

```make
CURL   = curl -L -o
CF     = clang-format -style=file -i
GITREF = git clone -o gh --depth 1
```

## mk/install.mk

```make
.PHONY : install update ref gz
install: $(WS)_install doc ref gz
	$(MAKE) update
update : $(WS)_update
ref    : $(RF)
gz     : $(GZ)

Debian_install Ubuntu_install:
# sudo dpkg --add-architecture i386
Debian_update  Ubuntu_update : apt.$(WS)
	sudo apt update
	sudo apt install -uy `cat $<` $(APT)

Msys_install:
# 	export  http_proxy="http://10.110.12.12:8888"
# 	export https_proxy="http://10.110.12.12:8888"
	pacman -S --noconfirm git make curl
	pacman -Suy
Msys_update: apt.Msys
	pacman -S --noconfirm $(shell cat $< | tr '\n' ' ')
```

## mk/ai.mk

```make
.PHONY: ai
ai:
	cat README.md lib/*.md > tmp/$(APP).ai.md
```
