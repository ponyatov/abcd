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
