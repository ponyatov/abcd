# files for any C/C++ project

```
lib
├── *.?                 # optional script modules
└── app.ini             # default program startup script (config file)
inc
├── app.hpp             # top-level header must be included in any .cpp
├── lib.hpp             # all used libs includes
├── syntax.hpp          # definitions for syntax parser
└── main.hpp
src
├── lexer.lex           # \ config files & scripts syntax parser
├── parser.yacc         # /
└── main.cpp            # generic entry for POSIX/Linux apps
```

- inc/
	- [[decl/cpp/app.hpp]]
		- [[decl/cpp/lib.hpp]]
		- [[decl/cpp/main.hpp]]
		- [[decl/cpp/syntax.hpp]]
- src/
	- [[decl/cpp/main.cpp]]

- [[decl/cpp/cmake|cmake]]
