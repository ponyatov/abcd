# src/main.cpp

```cpp
#include "app.hpp"

int main(int argc, char *argv[]) {
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
        yyfile = argv[i];
        assert(yyin = fopen(yyfile, "r"));
        yyparse();
        fclose(yyin);
        yyfile = nullptr;
    }
    return 0;
}

void arg(int argc, char *argv) {  //
    fprintf(stderr, "%i: <%s>\n", argc, argv);
}
```

- [[decl/cpp/main.hpp|main.hpp]]
- [[decl/cpp/syntax.hpp]]
- [[decl/cpp/lexer.lex]]
- [[decl/cpp/parser.yacc]]
