.PHONY: install update ref gz
install: ref gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.Debian` $(APT)
ref: $(RF)
gz:  $(GZ)
