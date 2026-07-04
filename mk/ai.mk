.PHONY: ai
ai: sync
	cat doc/decl/*.md doc/decl/cpp/*.md \
		doc/$(APP)/*.md README.md \
		$(C) $(H) root/isolinux/isolinux.cfg 
		Makefile mk/* \
			> tmp/abcd.ai.md
