# decl/mk/install.mk

```makefile
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

