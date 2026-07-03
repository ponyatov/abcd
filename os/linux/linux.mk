CFLAGS += -DLINUX

APT += libgmp-dev libmpfr-dev libmpc-dev libisl-dev

GMP_VER = 6.3.0
MPFR_VER = 4.2.2
# MPC_VER = 0.0.0
BINUTILS_VER = 2.43
GCC_VER      = 12.5.0
GDB_VER      = 0.0.0
LINUX_VER    = 0.0.0
UCLIBC_VER   = 0.0.0
BUSYBOX_VER  = 0.0.0

GMP      = gmp-$(GMP_VER)
MPFR     = mpfr-$(MPFR_VER)
MPC      = mpc-$(MPC_VER)
BINUTILS = binutils-$(BINUTILS_VER)
GCC      = gcc-$(GCC_VER)
GDB      = gdb-$(GDB_VER)
LINUX    = linux-$(LINUX_VER)
UCLIBC   = uclibc-$(UCLIBC_VER)
BUSYBOX  = busybox-$(BUSYBOX_VER)

YANDEX = https://mirror.yandex.ru/mirrors/gnu

GMP_GZ      = $(GMP).tar.xz
MPFR_GZ      = $(MPFR).tar.xz
MPC_GZ      = $(MPC).tar.xz
BINUTILS_GZ = $(BINUTILS).tar.xz
GCC_GZ      = $(GCC).tar.xz

GZ += $(HOME)/gz/$(GMP_GZ)
$(HOME)/gz/$(GMP_GZ):
	$(CURL) $@ $(YANDEX)/gmp/$(GMP_GZ)
GZ += $(HOME)/gz/$(MPFR_GZ)
$(HOME)/gz/$(MPFR_GZ):
	$(CURL) $@ $(YANDEX)/mpfr/$(MPFR_GZ)

GZ += $(HOME)/gz/$(BINUTILS_GZ)
$(HOME)/gz/$(BINUTILS_GZ):
	$(CURL) $@ $(YANDEX)/binutils/$(BINUTILS_GZ)

GZ += $(HOME)/gz/$(GCC_GZ)
$(HOME)/gz/$(GCC_GZ):
	$(CURL) $@ $(YANDEX)/gcc/$(GCC)/$(GCC_GZ)

.PHONY: gmp0

GCCLIBS0_CFG = --prefix=$(CROSS) --disable-shared
GMP0_CFG     = $(GCCLIBS0_CFG)

gmp0: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a:
	$(MAKE) $(REF)/$(GMP)/README.md
	mkdir -p $(TMP)/$(GMP) ; cd $(TMP)/$(GMP) ;\
	$(TPATH) $(REF)/$(GMP)/configure $(GMP0_CFG) &&\
	$(MAKE) && $(MAKE) install-strip &&\
	touch $@ ; rm -rf $(REF)/$(GMP) $(TMP)/$(GMP)

.PHONY: binutils0

BINUTILS0_CFG  = --prefix=$(CROSS) --target=$(TARGET) --disable-nls
BINUTILS0_CFG += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
BINUTILS0_CFG += --enable-lto --disable-multilib

binutils0: $(CROSS)/bin/$(TLD)
$(CROSS)/bin/$(TLD):
	$(MAKE) $(REF)/$(BINUTILS)/README.md
	mkdir -p $(TMP)/$(BINUTILS) ; cd $(TMP)/$(BINUTILS) ;\
	$(TPATH) $(REF)/$(BINUTILS)/configure $(BINUTILS0_CFG) &&\
	$(MAKE) && $(MAKE) install-strip &&\
	touch $@ ; rm -rf $(REF)/$(BINUTILS) $(TMP)/$(BINUTILS)

.PHONY: gcc0

GCC0_CFG  = $(BINUTILS0_CFG) --enable-languages="c"
GCC0_CFG += --disable-threads --without-headers --with-newlib

gcc0: $(CROSS)/bin/$(TCC)
$(CROSS)/bin/$(TCC):
	$(MAKE) $(REF)/$(GCC)/README.md
	mkdir -p $(TMP)/$(GCC) ; cd $(TMP)/$(GCC) ;\
	$(TPATH) $(REF)/$(GCC)/configure $(GCC0_CFG)

# unpack
$(REF)/%/README.md: $(HOME)/gz/%.tar.xz
	cd $(REF) ; xzcat $< | tar x && touch $@

# GCC
# GDB
# LINUX
# UCLIBC
# BUSYBOX
