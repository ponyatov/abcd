.PHONY: sync
sync:
	unison decl
	unison $(APP)
