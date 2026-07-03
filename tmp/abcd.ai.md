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
#pragma once

/// @defgroup libs libs
/// @{
#include <cassert>
#include <cstdio>
#include <cstdlib>
/// @}

/// @defgroup main main
/// @{
extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);
/// @}
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
%{
    #include "abcd.hpp"
%}

%option noyywrap yylineno

%%
%{
    #include "abcd.hpp"
%}

%%
syntax:
