APP = $(notdir $(CURDIR))

C += $(wildcard src/*.c*) tmp/$(APP).lex.cpp
H += $(wildcard inc/*.h*)

CFLAGS += -std=c++17 -Iinc -Itmp -O0 -g

.PHONY: all run
all: bin/$(APP) lib/$(APP).ini
run: bin/$(APP) lib/$(APP).ini
	$^

bin/$(APP): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

tmp/$(APP).lex.cpp: src/$(APP).lex
	flex -o $@ $<

.PHONY: sync
sync:
	unison decl
	unison $(APP)

.PHONY: ai
ai: sync
	cat doc/decl/*.md doc/$(APP)/*.md README.md \
		inc/* src/* \
			> tmp/abcd.ai.md
