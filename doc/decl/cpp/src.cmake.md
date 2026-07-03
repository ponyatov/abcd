# cmake/src.cmake

```make
file(GLOB_RECURSE C CONFIGURE_DEPENDS src/*.c*)
file(GLOB_RECURSE H CONFIGURE_DEPENDS inc/*.h*)
file(GLOB_RECURSE F CONFIGURE_DEPENDS lib/*.ini lib/*.? )

# include dirs
foreach(h ${H})
    get_filename_component(d ${h} DIRECTORY)
    list(APPEND INC ${d})
endforeach()
list(REMOVE_DUPLICATES INC)
include_directories(${CMAKE_CURRENT_BINARY_DIR} ${INC})
```
