# autoformat
## source code autoformatting

## C++

- `/.clang-format`
```
BasedOnStyle : Google
UseTab       : Never
IndentWidth  : 4
TabWidth     : 4
ColumnLimit  : 80
UseCRLF      : false

AllowShortBlocksOnASingleLine    : Always
AllowShortFunctionsOnASingleLine : All
SortIncludes                     : true
```

## JS/JSON

- `~/.prettirrc`
```
{
    "tabWidth"      : 4,
    "useTabs"       : false,
    "printWidth"    : 80,
    "endOfLine"     : "lf",
    "singleQuote"   : true,
    "semi"          : true,
    "bracketSpacing": true,
    "arrowParens"   : "always",
    "proseWrap"     : "always",
    "trailingComma" : "none"
}
```
