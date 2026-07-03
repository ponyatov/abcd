```makefile
RF += ref/HorizonServer/README.md
ref/HorizonServer/README.md:
	$(GITREF) https://github.com/Konkery/HorizonServer $(dir $@)
```
