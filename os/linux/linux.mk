CFLAGS += -DLINUX

APT += libgmp-dev libmpfr-dev libmpc-dev libisl-dev

# GMP_VER = 0.0.0
# MPFR_VER = 0.0.0
# MPC_VER = 0.0.0
BINUTILS_VER = 2.43
GCC_VER      = 0.0.0
GDB_VER      = 0.0.0
LINUX_VER    = 0.0.0
UCLIBC_VER   = 0.0.0
BUSYBOX_VER  = 0.0.0

# GMP = gmp-$(GMP_VER)
# MPFR = mpfr-$(MPFR_VER)
# MPC = mpc-$(MPC_VER)
BINUTILS = binutils-$(BINUTILS_VER)
GCC      = gcc-$(GCC_VER)
GDB      = gdb-$(GDB_VER)
LINUX    = linux-$(LINUX_VER)
UCLIBC   = uclibc-$(UCLIBC_VER)
BUSYBOX  = busybox-$(BUSYBOX_VER)

YANDEX = https://mirror.yandex.ru/mirrors/gnu

BINUTILS_GZ = $(BINUTILS).tar.xz

GZ += $(HOME)/gz/$(BINUTILS_GZ)
$(HOME)/gz/$(BINUTILS_GZ):
	$(CURL) $@ $(YANDEX)/binutils/$(BINUTILS_GZ)

.PHONY: binutils0

BINUTILS0_CFG += --prefix=$(CROSS) --target=$(TARGET) --disable-nls
BINUTILS0_CFG += --with-sysroot=$(ROOT) --with-native-system-header-dir=/include
BINUTILS0_CFG += --enable-lto --disable-multilib

binutils0: $(CROSS)/bin/$(TLD)
	$(TPATH) which $(TLD)
$(CROSS)/bin/$(TLD):
	$(MAKE) $(REF)/$(BINUTILS)/README.md
	mkdir -p $(TMP)/$(BINUTILS) ; cd $(TMP)/$(BINUTILS) ;\
	$(REF)/$(BINUTILS)/configure $(BINUTILS0_CFG) &&\
	$(MAKE) && $(MAKE) install-strip &&\
	touch $@ ; rm -rf $(REF)/$(BINUTILS) $(TMP)/$(BINUTILS)
$(REF)/$(BINUTILS)/README.md: $(HOME)/gz/$(BINUTILS_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

# BINUTILS
# GCC
# GDB
# LINUX
# UCLIBC
# BUSYBOX
