# [[cpp/clang-format|clang-format]]

every C/C++ project required this file in project root:

## `/.clang-format`

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
