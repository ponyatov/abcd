# cmake
## build scripts

```files
CMakeLists.txt
cmake/
    clean.cmake
    fw.cmake
    install.cmake
    net.cmake
    src.cmake
    syntax.cmake
    version.cmake
```

## libs/tools search

```
cmake/
    FindRAGEL.cmake
    FindREADLINE.cmake
    FindZMQ.cmake
```

## target toolchain configuration

- cross-build target can be switched using CMake presets

```files
CMakePresets.json
cmake/
    any_toolchain.cmake              // shared config
    x86_64-linux-gnu.cmake
    i686-w64-mingw32.cmake
    mingw-w64-ucrt-x86_64.cmake
    aarch64-linux-gnu.cmake
    armv7-linux-gnu.cmake
    arm-none-eabi.cmake
    xtensa-lx106-elf.cmake
```

```sh
touch CMakePresets.json
```

```json
{
    "version": 6,
    "buildPresets": [
        {
            "name"            :  "linux",
            "configurePreset" :  "linux",
            "targets"         : ["all","install"]
        }
    ],
    "configurePresets": [
        {
            "name"            : "common",
            "hidden"          :  true,
            "binaryDir"       : "${sourceDir}/tmp/${presetName}",
            "generator"       : "Unix Makefiles",
            "cacheVariables"  : {
                "CMAKE_INSTALL_PREFIX"    : "${sourceDir}/bin",
                "CMAKE_MODULE_PATH"       : "${sourceDir}/cmake",
                "CMAKE_BUILD_TYPE"        : "Debug",
                "CMAKE_COLOR_DIAGNOSTICS" :  false,
                "CMAKE_VERBOSE_MAKEFILE"  :  false
            }
        },
        {
            "name"            : "pc",
            "inherits"        : "common",
            "hidden"          : true,
            "cacheVariables"  : {"HW":"pc", "CPU":"i5", "ARCH":"x86_64"}
        },
        {
            "name"            : "linux",
            "inherits"        : "pc",
            "displayName"     : "x86_64-linux-gnu",
            "toolchainFile"   : "${sourceDir}/cmake/x86_64-linux-gnu.cmake",
            "cacheVariables"  : {"OS":"linux"}
        }
    ]
}
```

```sh
touch CMakeLists.txt
```

```cmake
cmake_minimum_required(VERSION 3.25)
get_filename_component(CMAKE_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
project(${CMAKE_PROJECT_NAME} VERSION 0.0.1 LANGUAGES CXX)
```
