# mk/sync.mk

```makefile
.PHONY: sync
sync: doc
	unison decl
	unison $(APP)
```
