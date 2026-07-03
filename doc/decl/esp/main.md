# main
> for any ESP project

[[ESP-IDF]] require `main` component in every project

```
main/
	CMakeLists.txt
	main.cpp
	main.hpp
```

## `main/CMakeLists.txt`

```
idf_component_register(SRC_DIRS "." INCLUDE_DIRS ".")
```
