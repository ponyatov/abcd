# mk/ai.mk

```makefile
.PHONY: ai
ai: sync
	cat README.md \
		decl/core/*.md decl/gui/*.md decl/net/*.md \
		decl/cpp/*.md inc/*.h* src/*.c* \
			README.md doc/ai.md > tmp/$(APP).ai.md

# 		decl/js/*.md ts/*.ts package.json tsconfig.json js/*.js \
# 		decl/py/*.md \
# 		decl/hw/*.md decl/esp/*.md \
# 		decl/rust/*.md Cargo.toml src/*.rs \
```
