# inc/syntax.hpp

```cpp
#pragma once

extern char *yyfile;
extern void yyerror(const char* msg);

#include "lexer.lex.hpp"
#include "parser.yacc.hpp"
```
