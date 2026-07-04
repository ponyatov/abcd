CFLAGS += -DLINUX

# APT += libgmp-dev libmpfr-dev libmpc-dev libisl-dev

GMP_VER      = 6.3.0
MPFR_VER     = 4.2.2
MPC_VER      = 1.4.1
BINUTILS_VER = 2.43
GCC_VER      = 12.5.0
# GDB_VER      = 0.0.0
LINUX_VER    = 5.19.9
# UCLIBC_VER   = 0.0.0
# BUSYBOX_VER  = 0.0.0

GMP      = gmp-$(GMP_VER)
MPFR     = mpfr-$(MPFR_VER)
MPC      = mpc-$(MPC_VER)
BINUTILS = binutils-$(BINUTILS_VER)
GCC      = gcc-$(GCC_VER)
GDB      = gdb-$(GDB_VER)
LINUX    = linux-$(LINUX_VER)
UCLIBC   = uclibc-$(UCLIBC_VER)
BUSYBOX  = busybox-$(BUSYBOX_VER)

YANDEX_GNU = https://mirror.yandex.ru/mirrors/gnu
YANDEX_KRN = https://mirror.yandex.ru/pub/linux/kernel/v5.x/

GMP_GZ      = $(GMP).tar.xz
MPFR_GZ     = $(MPFR).tar.xz
MPC_GZ      = $(MPC).tar.xz
BINUTILS_GZ = $(BINUTILS).tar.xz
GCC_GZ      = $(GCC).tar.xz
LINUX_GZ    = $(LINUX).tar.xz

GZ += $(HOME)/gz/$(GMP_GZ)
$(HOME)/gz/$(GMP_GZ):
	$(CURL) $@ $(YANDEX_GNU)/gmp/$(GMP_GZ)
GZ += $(HOME)/gz/$(MPFR_GZ)
$(HOME)/gz/$(MPFR_GZ):
	$(CURL) $@ $(YANDEX_GNU)/mpfr/$(MPFR_GZ)
GZ += $(HOME)/gz/$(MPC_GZ)
$(HOME)/gz/$(MPC_GZ):
	$(CURL) $@ $(YANDEX_GNU)/mpc/$(MPC_GZ)

GZ += $(HOME)/gz/$(BINUTILS_GZ)
$(HOME)/gz/$(BINUTILS_GZ):
	$(CURL) $@ $(YANDEX_GNU)/binutils/$(BINUTILS_GZ)
GZ += $(HOME)/gz/$(GCC_GZ)
$(HOME)/gz/$(GCC_GZ):
	$(CURL) $@ $(YANDEX_GNU)/gcc/$(GCC)/$(GCC_GZ)

GZ += $(HOME)/gz/$(LINUX_GZ)
$(HOME)/gz/$(LINUX_GZ):
	$(CURL) $@ $(YANDEX_KRN)/$(LINUX_GZ)

.PHONY: cclibs0 gmp0 mpfr0 mpc0
cclibs0: gmp0 mpfr0 mpc0

CCLIBS0_CFG  = --prefix=$(CROSS) --disable-shared
GMP0_CFG     = $(CCLIBS0_CFG)
MPFR0_CFG    = $(CCLIBS0_CFG)
MPC0_CFG     = $(CCLIBS0_CFG) --with-mpfr=$(CROSS)
CCLIBS0_WITH = --with-gmp=$(CROSS) --with-mpfr=$(CROSS) --with-mpc=$(CROSS)

gmp0: $(CROSS)/lib/libgmp.a
$(CROSS)/lib/libgmp.a:
	$(MAKE) $(REF)/$(GMP)/README.md
	mkdir -p $(TMP)/$(GMP) ; cd $(TMP)/$(GMP) ;\
	$(TPATH) $(REF)/$(GMP)/configure $(GMP0_CFG) &&\
	$(MAKE) && $(MAKE) install-strip &&\
	touch $@ ; rm -rf $(REF)/$(GMP) $(TMP)/$(GMP)

mpfr0: $(CROSS)/lib/libmpfr.a
$(CROSS)/lib/libmpfr.a:
	$(MAKE) $(REF)/$(MPFR)/README.md
	mkdir -p $(TMP)/$(MPFR) ; cd $(TMP)/$(MPFR) ;\
	$(TPATH) $(REF)/$(MPFR)/configure $(MPFR0_CFG) &&\
	$(MAKE) && $(MAKE) install-strip &&\
	touch $@ ; rm -rf $(REF)/$(MPFR) $(TMP)/$(MPFR)

mpc0: $(CROSS)/lib/libmpc.a
$(CROSS)/lib/libmpc.a:
	$(MAKE) $(REF)/$(MPC)/README.md
	mkdir -p $(TMP)/$(MPC) ; cd $(TMP)/$(MPC) ;\
	$(TPATH) $(REF)/$(MPC)/configure $(MPC0_CFG) &&\
	$(MAKE) && $(MAKE) install-strip &&\
	touch $@ ; rm -rf $(REF)/$(MPC) $(TMP)/$(MPC)

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

GCC0_CFG  = $(BINUTILS0_CFG) $(CCLIBS0_WITH) --enable-languages="c"
GCC0_CFG += --disable-threads --without-headers --with-newlib

gcc0: $(CROSS)/bin/$(TCC)
$(CROSS)/bin/$(TCC):
	$(MAKE) cclibs0
	$(MAKE) $(REF)/$(GCC)/README.md
	mkdir -p $(TMP)/$(GCC) ; cd $(TMP)/$(GCC) ;\
	$(TPATH) $(REF)/$(GCC)/configure $(GCC0_CFG)
	cd $(TMP)/$(GCC) ; $(MAKE) all-gcc
	cd $(TMP)/$(GCC) ; $(MAKE) install-gcc
# cd $(TMP)/$(GCC) ; $(MAKE) all-target-libgcc
# cd $(TMP)/$(GCC) ; $(MAKE) install-target-libgcc

.PHONY: linux

LINUX_CFG := ARCH=$(ARCH) CROSS_COMPILE=$(TARGET)-

linux: $(REF)/$(LINUX)/README.md
	cat os/linux/all.linux > $(dir $<).config ;\
	echo 'CONFIG_LOCALVERSION="-$(APP)"' >> $(dir $<).config ;\
	echo 'CONFIG_DEFAULT_HOSTNAME="abcd"' >> $(dir $<).config ;\
	cd $(dir $<) ;\
	$(TPATH) $(MAKE) $(LINUX_CFG) menuconfig &&\
	$(TPATH) $(MAKE) $(LINUX_CFG) bzImage &&\
	cp arch/x86/boot/bzImage $(BOOT)/
# $(TPATH) $(MAKE) $(LINUX_CFG) allnoconfig ;\

.PHONY: boot bin/$(APP).iso

ISOLINUX += $(ROOT)/isolinux/isohdpfx.bin
ISOLINUX += $(ROOT)/isolinux/isohdppx.bin
ISOLINUX += $(ROOT)/isolinux/isolinux.bin
ISOLINUX += $(ROOT)/isolinux/ldlinux.c32
ISOLINUX += $(ROOT)/EFI/BOOT/ldlinux.e64
ISOLINUX += $(ROOT)/EFI/BOOT/syslinux.c32


.PHONY: root $(ROOT)/boot/$(APP).cpio
root: $(ROOT)/boot/root.cpio
$(ROOT)/boot/root.cpio:
	cd $(ROOT) ; find . -type f \
		! -path "./boot/*" \
		! -path "./EFI/*" \
		! -path "./isolinux/*" \
	| cpio -o -H newc > $@

boot: bin/$(APP).iso
	$(QEMU) -vga qxl -boot d -cdrom $<
bin/$(APP).iso: $(ISOLINUX) $(ROOT)/boot/bzImage $(ROOT)/boot/root.cpio
	xorriso -as mkisofs -o $@ -r root -V $(APP) \
	-isohybrid-mbr $(ROOT)/isolinux/isohdpfx.bin \
	-b isolinux/isolinux.bin \
	-c isolinux/boot.cat -boot-load-size 4 -boot-info-table -no-emul-boot

$(ROOT)/isolinux/%: /usr/lib/ISOLINUX/%
	cp $< $@
$(ROOT)/isolinux/%: /usr/lib/syslinux/modules/bios/%
	cp $< $@
$(ROOT)/EFI/BOOT/%: /usr/lib/syslinux/modules/efi64/%
	cp $< $@

# unpack
$(REF)/%/README.md: $(HOME)/gz/%.tar.xz
	cd $(REF) ; xzcat $< | tar x && touch $@

# GCC
# GDB
# LINUX
# UCLIBC
# BUSYBOX
