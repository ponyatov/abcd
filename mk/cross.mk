HW   ?= pc
include hw/$(HW)/$(HW).mk
include cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk

TCC  = $(TARGET)-gcc
TXX  = $(TARGET)-g++
TLD  = $(TARGET)-ld

include os/$(OS)/$(OS).mk
