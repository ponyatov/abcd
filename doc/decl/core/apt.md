# apt

## `apt.Debian`

- minimal sw set required to `decl` install work (install this manually)
```
git make curl fzf
```

- IDE and file compare tools
	- **only for developer's workstation**
	- not applicable for Rpi or server-side sw deploy
```
code meld
```

- host C++ toolchain (compiler, debuggers, and autodoc)
```
g++ cmake pkg-config clang-format
gdb gdbserver valgrind doxygen
```

- parsers & ASCII data reader making tools
```
flex bison ragel libreadline-dev
```

- optional: libs for raw LCD emulation (making custom GUI etc)
```
libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev
```

- Python toolset
```
python3 python3-venv python3-pytest python3-autopep8 python3-ply
```

- JavaScript (back/front)
```
npm nodejs wabt
```
