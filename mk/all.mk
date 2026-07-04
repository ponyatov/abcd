.PHONY: all run
all: bin/$(APP) lib/$(APP).ini
run: bin/$(APP) lib/$(APP).ini
	$^
