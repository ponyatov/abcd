# mk/doc.mk

```makefile
.PHONY: doc
doc: $(DOC)
	unison $(APP)

.PHONY: doxy
doxy: .doxygen doc/DoxygenLayout.xml doc/logo.png doc
	rm -rf doc/html ; doxygen $< 1>/dev/null
```
