OS     ?= linux
TARGET ?= x86_64-linux-gnu
CFLAGS += -DX86_64

APT += syslinux isolinux xorriso

QEMU = qemu-system-x86_64
