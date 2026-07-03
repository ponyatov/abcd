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

BINUTILS_CFG += --prefix=$(CROSS) --target=$(TARGET)
binutils0: $(REF)/$(BINUTILS)/README.md
	mkdir -p $(TMP)/$(BINUTILS) ; cd $(TMP)/$(BINUTILS) ;\
	$(dir $<)/configure $(BINUTILS_CFG) &&\
	$(MAKE) && $(MAKE) install-strip
$(REF)/$(BINUTILS)/README.md: $(HOME)/gz/$(BINUTILS_GZ)
	cd $(REF) ; xzcat $< | tar x && touch $@

# BINUTILS
# GCC
# GDB
# LINUX
# UCLIBC
# BUSYBOX
