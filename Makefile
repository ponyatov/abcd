# var
APP = $(notdir $(CURDIR))

# dirs
CWD    = $(CURDIR)
TMP    = $(CWD)/tmp
REF    = $(CWD)/ref
CROSS  = $(CWD)/cross
ROOT   = $(CWD)/root
BOOT   = $(ROOT)/boot
TPATH := PATH=$(CROSS)/bin:$(PATH)

# cross
HW   ?= pc
include hw/$(HW)/$(HW).mk
include cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk

TCC  = $(TARGET)-gcc
TXX  = $(TARGET)-g++
TLD  = $(TARGET)-ld

include os/$(OS)/$(OS).mk

# tool
CURL = curl -L -o

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

CP += tmp/$(APP).lex.cpp

# cfg
CFLAGS += -std=c++17 -Iinc -Itmp -Ilib/inc -O0 -g
CFLAGS += -Ihw/$(HW)/inc -Icpu/$(CPU)/inc
CFLAGS += -Iarch/$(ARCH)/inc -Ios/$(OS)/inc

# all
.PHONY: all run
all: bin/$(APP) lib/$(APP).ini
run: bin/$(APP) lib/$(APP).ini
	$^

# rule
bin/$(APP): $(C) $(CP) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(CP) $(L)

tmp/$(APP).lex.cpp: src/$(APP).lex
	flex -o $@ $<

# doc
.PHONY: sync
sync:
	unison decl
	unison $(APP)

.PHONY: doxy
doxy: .doxygen doc/DoxygenLayout.xml vscode/logo.png
	rm -rf doc/html ; doxygen $< 1>/dev/null

.PHONY: ai
ai: sync
	cat doc/decl/*.md doc/decl/cpp/*.md \
		doc/$(APP)/*.md README.md \
		$(C) $(H) \
			> tmp/abcd.ai.md

# install
.PHONY: install update ref gz
install: ref gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.Debian` $(APT)
ref: $(RF)
gz:  $(GZ)
