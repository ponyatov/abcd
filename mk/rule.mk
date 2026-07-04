bin/$(APP): $(C) $(CP) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(CP) $(L)

tmp/$(APP).lex.cpp: src/$(APP).lex
	flex -o $@ $<
