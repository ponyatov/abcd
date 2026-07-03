# Introduction to [[decl/decl|decl]] language
# deepseek and other AI generation requirements
## free public chat used as AI translation engine

- deepseek
	  - can't work with file system directly
	  - can't read any ASCII files, has very limited list of supported text formats
		- so upload all .md files from `~/decl/lib`
			- treated as Mardown+Decl code ([[Literate Programming]])
- all answers from AI must be in a simple english
	- including code comments
	- to allow easy read generated code & docs both by non-native people and any AI
- for short `decl` snippets in chat
	- work as a high-level code translator from `decl`
	- into selected target language: JS
- **generated code must be**
	- optimized (not minimized!) to be as small & simple as possible
	- must be commented in doxygen style
		- @file
		- @brief
		- @author
		- @date: format `DD/MM/YYYY` (real current local time forced)
		- @details
	 - should be formatted with vertical alignment
	 - type annotations preferred without spaces around ':'
- DECL
	- **HAS NO PARENS** !!! `()` in function/call syntax 
		- () used only for expressions or operand grouping
 - DEEPSEEK: THIS IS FORCED TO **YOU** AND NO EXCEPTIONS:
	 - DECL:
		 - NO FUCKING ()'s !!!
		 - **HAS NO NEW** !!!
		 - **self. not required**
		 - {} required and must be ballanced
- [[decl/decl|decl]]
	- this target language must be selected by .decl file extension in AI request
	- syntax
		- ';' is expresssion splitter, not end of line finalizer
	- constructors
		- if init arguments has same names as class fields all implicit assignments must be dropped: no `self.field = field` or `field = field`
		- if any function has no body code,
			- it must be replaced with prototype without `{}`
			- and totally dropped if was not used in a code
# `decl` 0.0.1
## declarative [[lang/DSL|DSL]] source-to-source translator

(c) [[Dmitry Ponyatov]] <<dponyatov@gmail.com>> 2026 [[license/MIT|MIT]]

github: https://github.com/ponyatov/decl

```sh
git remote add gh   git@github.com:ponyatov/decl.git
git remote add flic git@gitflic.ru:dponyatov/decl.git
```

> DECL HAS NO () PARENS !!!

![[decl/toc]]

## [[project maintenance]]
## [[IDE]]: VSCode integration
## [[Obsidian]]: documenting
## [[spec]]

I want to write code for Linux (x86 and rpi3+) and firmware for Cortex-M and
ESP32C/ESP32S microcontrollers in my own high-level declarative DSL language.

Syntax and semantics: I want all the goodies and syntax features from
[[py/Python|Python]], [[Elixir]], and [[OCaml/OCaml|OCaml]]/[[Fsh|F#]]:
- actor model (threads + async messaging)
- rich pattern matching
- my targets is heterogenous clusters of multi-platform nodes, so I need cross-node messaging and rich (de)serialization
- class-based OOP

Instead of compilation, **high-level translation** from a set of `decl` files (every .md file = decl module) into human-readable embedded C++ code **using AI** must be used.

## Overview

`decl` is a high-level declarative DSL translator that converts literal
programming and specification files into human-readable embedded C++ code using
AI-assisted translation. It targets heterogeneous clusters of multi-platform
nodes including Linux (x86, RPi3+), Cortex-M microcontrollers, and ESP32C/ESP32S
devices.

## [[Literate Programming]]

- Markdown-разметка: описание логики системы в свободной форме
- decl-фрагменты: формальное описание на DSL

## Features

- Rich DSL syntax combining the best from Python, Elixir, Nim, and OCaml/F#
- Actor model with threads and async messaging
- Pattern matching for elegant code
- Class-based OOP with inheritance and polymorphism
- Cross-node messaging with automatic serialization/deserialization
- Multi-platform support from high-end Linux to resource-constrained MCUs

### Philosophy

Instead of traditional compilation, `decl` uses **literal programming** principles:

- Every `.md` file is a `decl` module (Markdown + Decl code)
- AI-assisted translation generates human-readable **Embedded C++**
- Documentation and code live together

## reference projects

reference projects used for deleveloping [[decl/decl|decl]] as a form of legacy code representation, and rework

- [[decl/horizon/horizon]]

## target platforms/languages

- [[decl/js/js]]
- [[decl/ts/ts]]
- [[decl/cpp/cpp|cpp]]
- [[decl/rust/rust]]

## [[decl/vending/vending|vending]]
# files
## project file structure

```files
bin/        // executable binaries & firmware images
doc/        //
    html/   // doxygen-generated reference manual
decl/
    **/*.md // treat .md file extension as Markdown+Decl (literal programming)
etc/        // custom app configs
    app.ini
lib/        // scripts library (if custom script language used in app)
    *.f
inc/
    *.hpp   // app-specific header files
src/
    *.cpp   // app-specific source code
tmp/        // temporary files (build, log,..)
ref/        // clone other's projects as reference from hithub here
```
```files
.clang-format   // C++ code autoformatting
.prettierrc     // JSON/JS  autoformatting
```
```files
apt.Debian      // default work system: Debian GNU/Linux 12+
apt.Ubuntu      // for build & use on servers & VMs
apt.Raspbian    // Raspberry Pi deploy
apt.Msys        // MSYS2 dependencies (Windows/MinGW)
```

## `decl` metalanguage specification

```
decl/           // metalanguage specification (modular structure)
    decl/*.md   // common `decl` spec
    cpp/        // `decl` module: C++ target (code generation)
    js/         // JavaScript target
    mcu/        // generic MCU-specific
    ...
```

see [[decl/module.md]]

- decl/ directory shared beetween projects via symlink:
```
ln -fs ~/decl/decl ~/project1/decl
ln -fs ~/decl/decl ~/project2/decl
...
```

- `decl/*.md` contains common spec
- `excl/ext/` extensions adds some optional features for some project
  - mk/ai.mk file should be tuned to add only needed/used `decl` extensions to minimize AI context
# reserved features

this language features are optional, not included in current `decl` specification, and reserved for future language releases:

- `int<128> // quad math`
- [[decl/math/complex]]
- [[delc/core/Strings#WCS-16]]
	- target languages native strings used for more code portability & generated code acception
# [[decl]] modular specification
## metacircular Decl language specification

```decl
language Decl:
	// minimize syntax noice:
	// - no () parens in functions calls
	// - tabbed pythonic syntax: no {} hell & forced code structure
```

## [[decl/Introduction]]
## [[decl/core/core|Core Language Specification]]
## [[decl/std/std|Standard Library]]
## [[Low-Level Platform Interop]]
# CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.25)
get_filename_component(CMAKE_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
project(${CMAKE_PROJECT_NAME} VERSION 0.0.1 LANGUAGES CXX C ASM)

include(version)  # binary files naming by version & git branch/hash
include(src)      # scan project for source code files

message("-- |")
message("-- | toolchain: " ${CMAKE_CXX_COMPILER} " @ " ${CMAKE_TOOLCHAIN_FILE})
message("-- |      host: " ${CMAKE_HOST_SYSTEM_NAME}-${CMAKE_HOST_SYSTEM_VERSION})
message("-- |    target: " "hw:" ${HW} " cpu:" ${CPU} " arch:" ${ARCH} " os:" ${OS})
message("-- |   startup: " "${S}")
message("-- |    linker: " "${LD}")
message("-- |    binary: " "${CMAKE_INSTALL_PREFIX}/${BIN_OUTPUT_NAME}${CMAKE_EXECUTABLE_SUFFIX}")
message("-- |       ini: " "${F}")
message("-- |      data: " "${DATA}")
message("-- |       cpp: " "${C} ${CP}")
message("-- |       hpp: " "${H} ${HP}")
message("-- |")

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${INC})

add_executable(${CMAKE_PROJECT_NAME}
    ${C}  ${H}          # C/C++ sources
    ${CP} ${HP}         # generated parsers
    ${S}  ${LD}         # embedded/lowlevel
    ${F}                # init/config files & scripts
    ${DATA}             # precompiled binary data (bytecode,..)
)

include(install) # target install
```
# CMakePresets.json

```json
{
    "version": 6,
    "buildPresets": [
        {
            "name"            :  "linux",
            "configurePreset" :  "linux",
            "targets"         : ["all","install"],
            "jobs"            :   4
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
# cmake/any_toolchain.cmake

```cmake
set(CMAKE_C_STANDARD   17)
set(CMAKE_CXX_STANDARD 23)

set(CMAKE_C_COMPILER_ID       GNU)
set(CMAKE_CXX_COMPILER_ID     GNU)

set(CMAKE_C_COMPILER   ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PREFIX}-as)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_LINKER       ${TOOLCHAIN_PREFIX}-ld)
set(CMAKE_OBJCOPY      ${TOOLCHAIN_PREFIX}-objcopy)
set(CMAKE_SIZE         ${TOOLCHAIN_PREFIX}-size)
set(CMAKE_RC_COMPILER  ${TOOLCHAIN_PREFIX}-windres)

# include(cross)

add_compile_options(
    # -Wall -Wextra               # -Wpedantic
    # -Wno-implicit-fallthrough   # ragel
    # -Wno-unused-function        # flex
    # -Wno-write-strings          # yacc
    # -Wno-unused-parameter       # stm32
    $<$<CONFIG:Debug>:-DDEBUG>
)

# string (TOUPPER ${APP}  APP_  )
# string (TOUPPER ${HW}   HW_   )
# string (TOUPPER ${CPU}  CPU_  )
# string (TOUPPER ${ARCH} ARCH_ )
# string (TOUPPER ${OS}   OS_   )

# add_compile_definitions(
#     APP=$(APP) ${APP_} ${HW_} ${CPU_} ${ARCH_} ${OS_}
# )

add_link_options(
    -Wl,--print-memory-usage
)

if(CMAKE_BUILD_TYPE MATCHES Debug)
    add_compile_options(-O0 -g3)
endif()
if(CMAKE_BUILD_TYPE MATCHES Release)
    add_compile_options(-Os -g0)
endif()

set(CMAKE_EXECUTABLE_SUFFIX_ASM ${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_EXECUTABLE_SUFFIX_C   ${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_EXECUTABLE_SUFFIX_CXX ${CMAKE_EXECUTABLE_SUFFIX})

# file(GLOB LD hw/${HW}/*.ld)
```
# inc/app.hpp

```cpp
#pragma once

#include "lib.hpp"
#include "main.hpp"
#include "syntax.hpp"
```
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
# cmake
## build scripts

```files
cmake/
CMakeLists.txt
CMakePresets.json
```
- [[decl/cpp/CMakeLists.txt|CMakeLists.txt]]
	- [[decl/cpp/version.cmake]]
	- [[decl/cpp/src.cmake]]
	- [[decl/cpp/syntax.cmake]]
	- [[decl/cpp/install.cmake]]

## libs/tools search

```files
cmake/
    FindRAGEL.cmake                // ragel used for some ASCII->num
    FindREADLINE.cmake             // command line edit
    FindZMQ.cmake                  // most simple IPC with async messages
```

## target toolchain configuration

cross-build target can be switched using CMake presets:

```files
CMakePresets.json
cmake/
    any_toolchain.cmake              // shared config
    x86_64-linux-gnu.cmake           // default: developer's Linux HOST
    mingw-w64-ucrt-x86_64.cmake      // modern 64-bit Windows
    i686-w64-mingw32.cmake           // compatibility: 32-bit (Win7+)
    aarch64-linux-gnu.cmake          // Raspberry Pi 4+
    armv7-linux-gnu.cmake            // retro 32-bit Raspberry's
    arm-none-eabi.cmake              // Cortex-M/STM32 MCU's
    xtensa-lx106-elf.cmake           // ESP32
```

- [[decl/cpp/CMakePresets.json|CMakePresets.json]]
- [[decl/cpp/any_toolchain.cmake]]
	- [[decl/cpp/x86_64-linux-gnu.cmake]]
# `cpp::`
## embedded C/C++ target

- preferred: embedded C++ (embedded Linux & MCUs)
  - hard realtime friendly code
  - minimize used libs (including too fat STL)
- generic C++ (backend/desktop)
- ignore anything relates to immutability

## bare metal

- some hardware platforms or special tasks requires ANSI/ISO C to be used

## [[decl/cpp/cross]]
# multitarget C/C++ project

## files

```
bin/
lib/
	inc/
		lib.hpp
	src/
		lib.cpp
inc/
	app.hpp
src/
	app.cpp
	app.lex
	app.yacc
hw/
	inc/
		hw.hpp
	pc/
		inc/
			pc.hpp
cpu/
	inc/
		cpu.hpp
	i5/
		inc/
			i5.hpp
arch/
	inc/
		arch.hpp
	x86_64/
		inc/
			x86_64.hpp
	i386/
		inc/
			i386.hpp
os/
	inc/
		os.hpp
```

## GNU make

- `Makefile`

```Makefile
# var
APP = $(notdir $(CURDIR))

# cross
HW   ?= pc
include hw/$(HW)/$(HW).mk
include cpu/$(CPU)/$(CPU).mk
include arch/$(ARCH)/$(ARCH).mk
include os/$(OS)/$(OS).mk

# src
C += $(wildcard  src/*.c* lib/src/*.c*)
C += $(wildcard   hw/$(HW)/src/*.c*)
C += $(wildcard  cpu/$(CPU)/src/*.c*)
C += $(wildcard arch/$(ARCH)/src/*.c*)
C += $(wildcard   os/$(OS)/src/*.c*)
H += $(wildcard  inc/*.h* lib/inc/*.h*)
H += $(wildcard   hw/$(HW)/inc/*.h*)
H += $(wildcard  cpu/$(CPU)/inc/*.h*)
H += $(wildcard arch/$(ARCH)/inc/*.h*)
H += $(wildcard   os/$(OS)/inc/*.h*)
```

- `hw/pc/pc.mk`

```Makefile
CPU ?= i5
CFLAGS += -DPC
```

- `cpu/i5/i5.mk`

```Makefile
ARCH = x86_64
CFLAGS += -DX86_64
```

- `arch/x86_64/x86_64.mk`

```Makefile
OS ?= linux
CFLAGS += -DX86_64
```

- `os/linux/linux.mk`

```Makefile
CFLAGS += -DLINUX
```
# [[doxygen/doxygen|doxygen]]

every C/C++ project requires this file must be in project root:

## `/.doxygen`

treat as decl interpolation template

```
PROJECT_NAME           = "{app.module}"
PROJECT_BRIEF          = "{app.title}"
PROJECT_LOGO           = doc/logo.png
LAYOUT_FILE            = doc/DoxygenLayout.xml
OUTPUT_DIRECTORY       = doc
HTML_OUTPUT            = html
INPUT                  = README.md inc src
INPUT                 += hw cpu arch os
INCLUDE_PATH           = inc
EXCLUDE                = ref/* lib/python* *.pdf *.djvu
WARN_IF_UNDOCUMENTED   = NO
RECURSIVE              = YES
USE_MDFILE_AS_MAINPAGE = README.md
GENERATE_LATEX         = NO
GENERATE_HTML          = YES
FILE_PATTERNS         += *.lex *.yacc *.ragel *.rl
EXTENSION_MAPPING      = lex=C++ yacc=C++ ragel=C++ rl=C++ ino=C++
HAVE_DOT               = YES
EXTRACT_ALL            = YES
EXTRACT_STATIC         = YES
EXTRACT_PRIVATE        = YES
EXTRACT_PACKAGE        = YES
EXTRACT_LOCAL_CLASSES  = YES
EXTRACT_LOCAL_METHODS  = YES
EXTRACT_ANON_NSPACES   = YES
SORT_GROUP_NAMES       = YES
REPEAT_BRIEF           = NO
CALL_GRAPH             = YES
CALLER_GRAPH           = YES
```
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
# cmake/install.cmake

```cmake
set_target_properties(${CMAKE_PROJECT_NAME}
    PROPERTIES OUTPUT_NAME ${BIN_OUTPUT_NAME}${CMAKE_EXECUTABLE_SUFFIX})

install(TARGETS ${CMAKE_PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_PREFIX})

add_custom_command(
    OUTPUT              ${CMAKE_INSTALL_PREFIX}/${CMAKE_PROJECT_NAME}
    DEPENDS             ${CMAKE_PROJECT_NAME}
    WORKING_DIRECTORY   ${CMAKE_SOURCE_DIR}
    COMMAND             ${CMAKE_COMMAND} -E create_symlink
    ARGS                ${BIN_OUTPUT_NAME}${CMAKE_EXECUTABLE_SUFFIX}
                        ${CMAKE_INSTALL_PREFIX}/${CMAKE_PROJECT_NAME})
```
# cpp::io
## std::io implementation in embedded C++

# src/lexer.lex

```cpp
%{
    char *yyfile = nullptr;
%}

%option noyywrap yylineno

%%
```
# inc/lib.hpp

```cpp
#pragma once

#include <cassert>
#include <cstdio>
#include <cstdlib>
```
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
# inc/main.hpp

```
#pragma once

extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);
```
# src/parser.yacc

```cpp
%{
    #include "syntax.hpp"
%}

%defines

%%
syntax:
```
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
# cmake/syntax.cmake

```cmake
find_package(FLEX     REQUIRED)
find_package(BISON    REQUIRED)
find_package(RAGEL    REQUIRED)
find_package(READLINE REQUIRED)

file(GLOB_RECURSE X CONFIGURE_DEPENDS src/*.l*)
file(GLOB_RECURSE Y CONFIGURE_DEPENDS src/*.y*)
file(GLOB_RECURSE R CONFIGURE_DEPENDS src/*.r*)

foreach(lex ${X})
    get_filename_component(name ${lex} NAME_WE)
    set(cpp "${CMAKE_CURRENT_BINARY_DIR}/${name}.lex.cpp")
    set(hpp "${CMAKE_CURRENT_BINARY_DIR}/${name}.lex.hpp")
    list(APPEND CP ${cpp})
    list(APPEND HP ${hpp})
    add_custom_command(
        OUTPUT  ${cpp} ${hpp}
        DEPENDS ${lex}
        COMMAND ${FLEX_EXECUTABLE} -o${cpp} --header-file=${hpp} ${lex}
    )
endforeach()

foreach(yacc ${Y})
    get_filename_component(name ${yacc} NAME_WE)
    set(cpp "${CMAKE_CURRENT_BINARY_DIR}/${name}.yacc.cpp")
    set(hpp "${CMAKE_CURRENT_BINARY_DIR}/${name}.yacc.hpp")
    list(APPEND CP ${cpp})
    list(APPEND HP ${hpp})
    add_custom_command(
        OUTPUT  ${cpp} ${hpp}
        DEPENDS ${yacc}
        COMMAND ${BISON_EXECUTABLE} -o${cpp} ${yacc}
    )
endforeach()

foreach(ragel ${R})
    get_filename_component(name ${ragel} NAME_WE)
    set(cpp "${CMAKE_CURRENT_BINARY_DIR}/${name}.ragel.cpp")
    set(hpp "${CMAKE_CURRENT_BINARY_DIR}/${name}.ragel.hpp")
    list(APPEND CP ${cpp})
    list(APPEND HP ${hpp})
    add_custom_command(
        OUTPUT  ${cpp} ${hpp}
        DEPENDS ${ragel}
        COMMAND ${RAGEL_EXECUTABLE} -C -G2 -o ${cpp} ${ragel}
    )
endforeach()
```
# inc/syntax.hpp

```cpp
#pragma once

extern char *yyfile;
extern void yyerror(const char* msg);

#include "lexer.lex.hpp"
#include "parser.yacc.hpp"
```
# cmake/version.cmake

```cmake
execute_process(
    OUTPUT_VARIABLE BRANCH
    COMMAND git rev-parse --abbrev-ref HEAD
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    OUTPUT_VARIABLE NOW
    COMMAND date +%y%m%d # _%H%M
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    OUTPUT_VARIABLE REL
    COMMAND git rev-parse --short=4 HEAD
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(BIN_OUTPUT_NAME ${CMAKE_PROJECT_NAME}_${BRANCH}_${NOW}_${REL})
```
# cmake/x86_64-linux-gnu.cmake

```cmake
set(CMAKE_SYSTEM_NAME       Linux)
set(CMAKE_SYSTEM_PROCESSOR  x86_64)
set(TOOLCHAIN_PREFIX        x86_64-linux-gnu)
set(CMAKE_EXECUTABLE_SUFFIX "")

include(any_toolchain)

add_compile_definitions(X86_64 LINUX)
add_compile_options(-mtune=native)
add_link_options()
# -fsanitize=thread -static-libtsan -ltsan
```
# ![](vscode/logo.png) `abcd` 0.0.1
## Async ByteCode Dynamic language VM

(c) [[Dmitry Ponyatov]] <<dponyatov@gmail.com>> 2026 [[license/MIT|MIT]]

github: https://github.com/ponyatov/abcd

## Overview

**abcd** is an Virtual Machine designed as the dynamic language runtime for microcontrollers, embedded/server/desktop Linux, and mobile phones. It provides a lightweight, high-performance execution environment for heterogeneous clusters of multi-platform nodes including Linux (x86, RPi3+), Cortex-M microcontrollers, and ESP32C/ESP32S devices.

## Targets

top-down priority:

- **Server/Desktop Linux** (x86_64, i386/retro)
- **Embedded Linux** (RPi3+, ARM devices, i386/PC104)
- **Microcontrollers** (Cortex-M, ESP32C, ESP32S)
- **Mobile phones** (Android)

## Features

- **ByteCode interpreter** optimized for MCU-based platforms
	- **Multi-platform** heterogenous clusters of interconnected nodes
	- **Lightweight design**: minimal binary size, 16bit code & data pointers
- **Async execution** with actor model (isolated threads + async messaging)
	- **Cross-node messaging** with automatic serialization/deserialization
- **Dynamic language** features with runtime flexibility
	- **Thread-local GC** for automatic memory management
	- **Class-based OOP** with inheritance and polymorphism
	- **Rich pattern matching** support (inspired by Elixir/OCaml)
# ![](vscode/logo.png) `abcd` 0.0.1
## Async ByteCode Dynamic language VM

(c) Dmitry Ponyatov <<dponyatov@gmail.com>> 2026 MIT

github: https://github.com/ponyatov/abcd

## Overview

**abcd** is an Virtual Machine designed as the dynamic language runtime for microcontrollers, embedded/server/desktop Linux, and mobile phones. It provides a lightweight, high-performance execution environment for heterogeneous clusters of multi-platform nodes including Linux (x86, RPi3+), Cortex-M microcontrollers, and ESP32C/ESP32S devices.

## Targets

top-down priority:

- **Server/Desktop Linux** (x86_64, i386/retro)
- **Embedded Linux** (RPi3+, ARM devices, i386/PC104)
- **Microcontrollers** (Cortex-M, ESP32C, ESP32S)
- **Mobile phones** (Android)

## Features

- **ByteCode interpreter** optimized for MCU-based platforms
	- **Multi-platform** heterogenous clusters of interconnected nodes
	- **Lightweight design**: minimal binary size, 16bit code & data pointers
- **Async execution** with actor model (isolated threads + async messaging)
	- **Cross-node messaging** with automatic serialization/deserialization
- **Dynamic language** features with runtime flexibility
	- **Thread-local GC** for automatic memory management
	- **Class-based OOP** with inheritance and polymorphism
	- **Rich pattern matching** support (inspired by Elixir/OCaml)
#include "abcd.hpp"

int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
    return 0;
}

void arg(int argc, char *argv) {  //
    fprintf(stderr, "%i: %s\n", argc, argv);
}
#pragma once

#include "lib.hpp"

#ifdef LINUX
#include "linux.hpp"
#endif

/// @brief opcode
enum class Op : uint8_t {  //
    nop = 0x00,
    halt = 0xFF
}
/// @defgroup lib lib
/// @{
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstdint>
/// @}
/// @defgroup pc pc
/// @ingroup hw
/// @defgroup i5 i5
/// @ingroup cpu
/// @defgroup x86_64 x86_64
/// @ingroup arch
/// @defgroup linux linux
/// @ingroup os

/// @defgroup main main
/// @ingroup lib
/// @{
extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);
/// @}
